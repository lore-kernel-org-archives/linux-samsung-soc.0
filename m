From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Exynos5422 EHCI (USB 2.0) - Odroid XU4 - port 1 resume error -110
Date: Mon, 30 Jan 2017 12:08:23 +0530
Message-ID: <CANAwSgQBokKOg=Gv0JsBom1YMB43yGzQsV-cEx+qp7W_WZJqTQ@mail.gmail.com>
References: <CAJKOXPdFuixraNh_aZt9OMU5bEjtS81dz-mBLfWRBE6ejjeWaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a113d37ec16da9005474a11e0
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPdFuixraNh_aZt9OMU5bEjtS81dz-mBLfWRBE6ejjeWaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kamil Debski <kamil-MZ2JYD8fkKLYtjvyW6yDsg@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Markus Reichl <m.reichl-SRyzfwRm/0rPTwkrwQOX7A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--001a113d37ec16da9005474a11e0
Content-Type: text/plain; charset=UTF-8

Hi Krzysztof,

On 29 January 2017 at 19:05, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> Hi,
>
> On Odroid XU4 with an external usb2514 hub (evaluation board from SMSC
> or TI) connected to the USB2.0 port of EHCI controller, whenever I
> plug some USB device into the usb2514 hub I see errors like:
> [   73.969179] exynos-ehci 12110000.usb: port 1 resume error -110
> [   74.003259] usb 1-1: USB disconnect, device number 2
> [   74.017432] usb usb1-port1: cannot reset (err = -32)
> [   74.021141] usb usb1-port1: cannot reset (err = -32)
> [   74.026832] usb usb1-port1: cannot reset (err = -32)
> [   74.030974] usb usb1-port1: cannot reset (err = -32)
> [   74.036677] usb usb1-port1: cannot reset (err = -32)
> [   74.041919] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
> [   74.140923] usb usb1-port1: unable to enumerate USB device
>
> Flooding the console. USB device does not work.
>
> Tested:
> 1. next-20170125,
> 2. mainline v4.10-rc5-393-g53cd1ad1a68f,
> 3. Hardkernel vendor kernel 3.10
>
>
> It does not look like an issue of usb2514 but rather a combination of
> usb2514 + Exynos EHCI because:
> 1. Happens only when usb2514 hub is directly connected to the USB2.0
> port of EHCI controller.
> 2. If usb2514 is connected through other hub (like to other ports on
> the board) - everything works fine.
> 3. I tested two different usb2514 hubs - one from TI, second from
> SMSC. Both behave the same.
> 4. I had the same issue on DWC3 controller (USB 3.0 port) and in that
> case helped ENABLING bits DWC3_GUSB2PHYCFG_SUSPHY and
> DWC3_GUSB3PIPECTL_SUSPHY which is I think equal to disabling the
> snps,dis_u3_susphy_quirk quirks.
>
>
> It seems that issue is strictly related to Exynos5422 USB 2.0 driver
> (phy?) and this hub. The drivers involved:
>  - drivers/phy/phy-exynos5250-usb2.c
>  - drivers/phy/phy-samsung-usb2.c
>  - drivers/usb/host/ehci-exynos.c
>
> Any ideas?
>
> Best regards,
> Krzysztof

I feel vbus input configuration is missing in the OdroidXU4.
for both ehci 2.0 port and dwc3 controller.

id-gpio and vbus-gpio configuration is also missing.

I am just attaching small changes from my side but it's not working
correctly at my end.

-Best Regards
-Anand

--001a113d37ec16da9005474a11e0
Content-Type: application/octet-stream; name="usbvbus.patch"
Content-Disposition: attachment; filename="usbvbus.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iyjp6yq90

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1v
bi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0
c2kKaW5kZXggMDViOWFmZGQuLjUyMGRmODYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpCkBAIC0xNDUsNiArMTQ1LDM0IEBACiAJ
CQl9OwogCQl9OwogCX07CisKKwl1c2IzMDBfdmJ1c19yZWc6IHJlZ3VsYXRvci11c2IzMDAgewor
CQljb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7CisJCXJlZ3VsYXRvci1uYW1lID0gIlZV
U0JfQk9PU1RfNVYwIjsKKwkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAwMD47CisJ
CXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDUwMDAwMDA+OworCQlncGlvID0gPCZncHk2IDIg
R1BJT19BQ1RJVkVfSElHSD47CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CisJCXBpbmN0
cmwtMSA9IDwmdXNiMzAwX3ZidXNfZW4+OworCQllbmFibGUtYWN0aXZlLWhpZ2g7CisJfTsKKwor
CXVzYjMwMV92YnVzX3JlZzogcmVndWxhdG9yLXVzYjMwMSB7CisJCWNvbXBhdGlibGUgPSAicmVn
dWxhdG9yLWZpeGVkIjsKKwkJcmVndWxhdG9yLW5hbWUgPSAiVlVTQl9CT09TVF81VjEiOworCQly
ZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw1MDAwMDAwPjsKKwkJcmVndWxhdG9yLW1heC1taWNy
b3ZvbHQgPSA8NTAwMDAwMD47CisJCWdwaW8gPSA8JmdwZzEgNCBHUElPX0FDVElWRV9ISUdIPjsK
KwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwkJcGluY3RybC0xID0gPCZ1c2IzMDFfdmJ1
c19lbj47CisJCWVuYWJsZS1hY3RpdmUtaGlnaDsKKwl9OworCisJdXNiLXN3aXRjaCB7CisJCXNh
bXN1bmcsaWQtZ3BpbyA9IDwmZ3B4MyAxIDB4Zj47CisJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7CisJCXBpbmN0cmwtMSA9IDwmaWQyX2lycT47CisJfTsKIH07CiAKICZhZGMgewpAQCAtNTcw
LDYgKzU5OCwxMiBAQAogCQlzYW1zdW5nLHBpbi1wdWQgPSA8RVhZTk9TX1BJTl9QVUxMX05PTkU+
OwogCQlzYW1zdW5nLHBpbi1kcnYgPSA8RVhZTk9TNTQyMF9QSU5fRFJWX0xWMT47CiAJfTsKKwor
CWlkMl9pcnE6IGlkMi1pcnEgeworCQlzYW1zdW5nLHBpbnMgPSAiZ3B4My0xIjsKKwkJc2Ftc3Vu
ZyxwaW4tZnVuY3Rpb24gPSA8RVhZTk9TX1BJTl9GVU5DX0Y+OworICAgICAgICAgICAgICAgIHNh
bXN1bmcscGluLXB1ZCA9IDxFWFlOT1NfUElOX1BVTExfTk9ORT47CisJfTsKIH07CiAKICZwaW5j
dHJsXzEgewpAQCAtNTc5LDYgKzYxMywyMCBAQAogCQlzYW1zdW5nLHBpbi1wdWQgPSA8RVhZTk9T
X1BJTl9QVUxMX05PTkU+OwogCQlzYW1zdW5nLHBpbi1kcnYgPSA8RVhZTk9TNTQyMF9QSU5fRFJW
X0xWMT47CiAJfTsKKworCXVzYjMwMF92YnVzX2VuOiB1c2IzMDAtdmJ1cy1lbiB7CisJCXNhbXN1
bmcscGlucyA9ICJncHk2LTIiOworCQlzYW1zdW5nLHBpbi1mdW5jdGlvbiA9IDxFWFlOT1NfUElO
X0ZVTkNfT1VUUFVUPjsKKwkJc2Ftc3VuZyxwaW4tcHVkID0gPEVYWU5PU19QSU5fUFVMTF9OT05F
PjsKKwkJc2Ftc3VuZyxwaW4tZHJ2ID0gPEVYWU5PUzU0MjBfUElOX0RSVl9MVjE+OworCX07CisK
Kwl1c2IzMDFfdmJ1c19lbjogdXNiMzAxLXZidXMtZW4geworCQlzYW1zdW5nLHBpbnMgPSAiZ3Bn
MS00IjsKKwkJc2Ftc3VuZyxwaW4tZnVuY3Rpb24gPSA8RVhZTk9TX1BJTl9GVU5DX09VVFBVVD47
CisJCXNhbXN1bmcscGluLXB1ZCA9IDxFWFlOT1NfUElOX1BVTExfTk9ORT47CisJCXNhbXN1bmcs
cGluLWRydiA9IDxFWFlOT1M1NDIwX1BJTl9EUlZfTFYxPjsKKwl9OwogfTsKIAogJnRtdV9jcHUw
IHsKQEAgLTYwNyw2ICs2NTUsMTAgQEAKIAljbG9jay1uYW1lcyA9ICJydGMiLCAicnRjX3NyYyI7
CiB9OwogCismdXNiaG9zdDIgeworCXNhbXN1bmcsdmJ1cy1ncGlvID0gPCZncHgyIDYgR1BJT19B
Q1RJVkVfSElHSD47Cit9OworCiAmdXNiZHJkX2R3YzNfMCB7CiAJZHJfbW9kZSA9ICJob3N0IjsK
IH07CkBAIC02MTQsMTEgKzY2NiwxMyBAQAogLyogdXNiZHJkX2R3YzNfMSBtb2RlIGN1c3RvbWl6
ZWQgaW4gZWFjaCBib2FyZCAqLwogCiAmdXNiZHJkM18wIHsKKwl2YnVzLXN1cHBseSA9IDwmdXNi
MzAwX3ZidXNfcmVnPjsKIAl2ZGQzMy1zdXBwbHkgPSA8JmxkbzlfcmVnPjsKIAl2ZGQxMC1zdXBw
bHkgPSA8JmxkbzExX3JlZz47CiB9OwogCiAmdXNiZHJkM18xIHsKKwl2YnVzLXN1cHBseSA9IDwm
dXNiMzAxX3ZidXNfcmVnPjsKIAl2ZGQzMy1zdXBwbHkgPSA8JmxkbzlfcmVnPjsKIAl2ZGQxMC1z
dXBwbHkgPSA8JmxkbzExX3JlZz47CiB9OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNTR4eC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTR4eC5kdHNpCmluZGV4
IDAzODllOGEuLjBjYTA5NzcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0
eHguZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1NHh4LmR0c2kKQEAgLTEzNCw2
ICsxMzQsOSBAQAogCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA3MiBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsKIAkJCQlwaHlzID0gPCZ1c2JkcmRfcGh5MCAwPiwgPCZ1c2JkcmRfcGh5MCAxPjsKIAkJ
CQlwaHktbmFtZXMgPSAidXNiMi1waHkiLCAidXNiMy1waHkiOworCQkJCXNucHMsdXNiM19scG1f
Y2FwYWJsZTsKKwkJCQlzbnBzLGRpc191M19zdXNwaHlfcXVpcms7CisJCQkJc25wcyxkaXNfdTJf
c3VzcGh5X3F1aXJrOwogCQkJfTsKIAkJfTsKIApAQCAtMTU0LDYgKzE1Nyw5IEBACiAJCQkJcmVn
ID0gPDB4MTI0MDAwMDAgMHgxMDAwMD47CiAJCQkJcGh5cyA9IDwmdXNiZHJkX3BoeTEgMD4sIDwm
dXNiZHJkX3BoeTEgMT47CiAJCQkJcGh5LW5hbWVzID0gInVzYjItcGh5IiwgInVzYjMtcGh5IjsK
KwkJCQlzbnBzLHVzYjNfbHBtX2NhcGFibGU7CisJCQkJc25wcyxkaXNfdTNfc3VzcGh5X3F1aXJr
OworCQkJCXNucHMsZGlzX3UyX3N1c3BoeV9xdWlyazsKIAkJCX07CiAJCX07CiAK
--001a113d37ec16da9005474a11e0--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
