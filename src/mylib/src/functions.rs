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
pub extern fn foo_int_sq() -> c_int {
  foo_int() * foo_int() as c_int
}

#[no_mangle]
pub extern fn foo_intx(x: c_int) -> c_int {
    x
}

#[no_mangle]
pub extern fn foo_intxy(x: c_int, y: c_int) -> c_int {
    x * y
}

#[no_mangle]
pub extern fn foo_intn(x: *const c_int) -> *const c_int {
    x
}

#[no_mangle]
pub extern fn foo_dbl() -> c_double {
    4.2 as c_double
}

#[no_mangle]
pub extern fn foo_dbl_sq() -> c_double {
    foo_dbl() * foo_dbl() as c_double
}

#[no_mangle]
pub extern fn foo_dblx(x: c_double) -> c_double {
    x
}

#[no_mangle]
pub extern fn foo_dblxy(x: c_double, y: c_double) -> c_double {
    x / y
}

#[no_mangle]
pub extern fn foo_mk_dbl(x: c_int) -> *const c_double {
    let out: Vec<f64> = vec![0.0; x as usize];
    out.as_ptr()
}

#[no_mangle]
pub extern fn foo_mk_seq(x: c_int) -> *const c_int {
    let mut out: Vec<i32> = vec![];
    for i in 0..x {
        out.push(i + 1 as i32)
    }
    out.as_mut_ptr()
}
