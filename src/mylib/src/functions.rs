use libc;
use std;

use libc::c_char;
use libc::c_int;
use libc::c_double;
use std::ffi::CString;

#[no_mangle]
pub extern fn foo_hello() -> *const c_char {
    let orig = CString::new("Hello, world.").unwrap();
    let out = orig.as_ptr();
    std::mem::forget(orig);
    out
}

#[no_mangle]
pub extern fn foo_int() -> c_int {
    42 as c_int
}

#[no_mangle]
pub extern fn foo_dbl() -> c_double {
    4.2 as c_double
}