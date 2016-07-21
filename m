From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: pin stats
Date: Thu, 21 Jul 2016 11:10:51 +0200
Message-ID: <CAJKOXPce+DOM6UQs1g32E4P730F+-Tjm=8XHe93=CxaNVX57kg@mail.gmail.com>
References: <CANMsd017L1O+huEu=LOcfm2rD-3Qp-kJS32GA0AgTdPFWD_qoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a114093ced896fe053821b112
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36190 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751880AbcGUJKx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 05:10:53 -0400
Received: by mail-oi0-f53.google.com with SMTP id w18so108714321oiw.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Jul 2016 02:10:52 -0700 (PDT)
In-Reply-To: <CANMsd017L1O+huEu=LOcfm2rD-3Qp-kJS32GA0AgTdPFWD_qoQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ryan <ryanphilips19@googlemail.com>
Cc: linux-samsung-soc@vger.kernel.org

--001a114093ced896fe053821b112
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 21, 2016 at 7:15 AM, Ryan <ryanphilips19@googlemail.com> wrote:
> Hey,
>
> Can i dump the gpio states just before exynos is put to sleep?
>
> What would be the best place to do that? are there any example drivers which
> can do this?

I assume that /sys/kernel/debug/gpio is not sufficient... I got some
old debug code (for 3.10 :) ) for dumping the registers. Feel free to
use it under GPLv2 (derivative work from Linux kernel) - attached. If
you need specific values you would have to decode the data into
something readable.

Best regards,
Krzysztof

--001a114093ced896fe053821b112
Content-Type: text/x-patch; charset=US-ASCII;
	name="310-pinctrl-exynos-Dump-GPIO-on-suspend-and-resume.patch"
Content-Disposition: attachment;
	filename="310-pinctrl-exynos-Dump-GPIO-on-suspend-and-resume.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iqw3jrff0

RnJvbSBiZmQ3ODkzODdjYzY3ZWIzNDc1MmJlNGM0MGU0ZTQ5NGU0OTliZWM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3NraUBzYW1z
dW5nLmNvbT4KRGF0ZTogVGh1LCAxMyBGZWIgMjAxNCAxNTowMzo0NyArMDEwMApTdWJqZWN0OiBb
UEFUQ0hdIHBpbmN0cmw6IGV4eW5vczogRHVtcCBHUElPIG9uIHN1c3BlbmQgYW5kIHJlc3VtZQoK
LS0tCiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1leHlub3MuYyB8ICAgMjcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWV4eW5vcy5jIGIvZHJpdmVycy9waW5jdHJs
L3BpbmN0cmwtZXh5bm9zLmMKaW5kZXggNGM4NGU2MWY5YzQ0Li42OTMxYmQwMjQ5MTMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLWV4eW5vcy5jCisrKyBiL2RyaXZlcnMvcGlu
Y3RybC9waW5jdHJsLWV4eW5vcy5jCkBAIC02MTMsMTIgKzYxMywzNyBAQCBzdGF0aWMgdm9pZCBl
eHlub3NfcGluY3RybF9zdXNwZW5kX2JhbmsoCiAJcHJfZGVidWcoIiVzOiBzYXZlIGZsdGNvbjEg
JSMwMTB4XG4iLCBiYW5rLT5uYW1lLCBzYXZlLT5laW50X2ZsdGNvbjEpOwogfQogCitzdGF0aWMg
dm9pZCBleHlub3NfcGluY3RybF9kdW1wKHN0cnVjdCBzYW1zdW5nX3BpbmN0cmxfZHJ2X2RhdGEg
KmRydmRhdGEpCit7CisJc3RydWN0IHNhbXN1bmdfcGluX2N0cmwgKmN0cmwgPSBkcnZkYXRhLT5j
dHJsOworCXN0cnVjdCBzYW1zdW5nX3Bpbl9iYW5rICpiYW5rID0gY3RybC0+cGluX2JhbmtzOwor
CXZvaWQgX19pb21lbSAqcmVncyA9IGRydmRhdGEtPnZpcnRfYmFzZTsKKwlpbnQgaTsKKworCWZv
ciAoaSA9IDA7IGkgPCBjdHJsLT5ucl9iYW5rczsgKytpLCArK2JhbmspIHsKKwkJcHJfaW5mbygi
R1BJTzogJTRzICUwOHg6ICUjMDEweCAlIzAxMHggJSMwMTB4XG4iLAorCQkJYmFuay0+bmFtZSwK
KwkJCWJhbmstPnBjdGxfb2Zmc2V0LAorCQkJcmVhZGwocmVncyArIGJhbmstPnBjdGxfb2Zmc2V0
KSwKKwkJCXJlYWRsKHJlZ3MgKyBiYW5rLT5wY3RsX29mZnNldCArIDB4MDQpLAorCQkJcmVhZGwo
cmVncyArIGJhbmstPnBjdGxfb2Zmc2V0ICsgMHgwOCkpOworCQlwcl9pbmZvKCJHUElPOiAlNHMg
JTA4eDogJSMwMTB4ICUjMDEweCAlIzAxMHhcbiIsCisJCQliYW5rLT5uYW1lLAorCQkJYmFuay0+
cGN0bF9vZmZzZXQsCisJCQlyZWFkbChyZWdzICsgYmFuay0+cGN0bF9vZmZzZXQgKyAweDBjKSwK
KwkJCXJlYWRsKHJlZ3MgKyBiYW5rLT5wY3RsX29mZnNldCArIDB4MTApLAorCQkJcmVhZGwocmVn
cyArIGJhbmstPnBjdGxfb2Zmc2V0ICsgMHgxNCkpOworCX0KK30KKwogc3RhdGljIHZvaWQgZXh5
bm9zX3BpbmN0cmxfc3VzcGVuZChzdHJ1Y3Qgc2Ftc3VuZ19waW5jdHJsX2Rydl9kYXRhICpkcnZk
YXRhKQogewogCXN0cnVjdCBzYW1zdW5nX3Bpbl9jdHJsICpjdHJsID0gZHJ2ZGF0YS0+Y3RybDsK
IAlzdHJ1Y3Qgc2Ftc3VuZ19waW5fYmFuayAqYmFuayA9IGN0cmwtPnBpbl9iYW5rczsKIAlpbnQg
aTsKIAorCWV4eW5vc19waW5jdHJsX2R1bXAoZHJ2ZGF0YSk7CisKIAlmb3IgKGkgPSAwOyBpIDwg
Y3RybC0+bnJfYmFua3M7ICsraSwgKytiYW5rKQogCQlpZiAoYmFuay0+ZWludF90eXBlID09IEVJ
TlRfVFlQRV9HUElPKQogCQkJZXh5bm9zX3BpbmN0cmxfc3VzcGVuZF9iYW5rKGRydmRhdGEsIGJh
bmspOwpAQCAtNjU4LDYgKzY4Myw4IEBAIHN0YXRpYyB2b2lkIGV4eW5vc19waW5jdHJsX3Jlc3Vt
ZShzdHJ1Y3Qgc2Ftc3VuZ19waW5jdHJsX2Rydl9kYXRhICpkcnZkYXRhKQogCWZvciAoaSA9IDA7
IGkgPCBjdHJsLT5ucl9iYW5rczsgKytpLCArK2JhbmspCiAJCWlmIChiYW5rLT5laW50X3R5cGUg
PT0gRUlOVF9UWVBFX0dQSU8pCiAJCQlleHlub3NfcGluY3RybF9yZXN1bWVfYmFuayhkcnZkYXRh
LCBiYW5rKTsKKworCWV4eW5vc19waW5jdHJsX2R1bXAoZHJ2ZGF0YSk7CiB9CiAKIC8qIHBpbiBi
YW5rcyBvZiBleHlub3MzMjUwIHBpbi1jb250cm9sbGVyIDAgKi8KLS0gCjEuNy45LjUKCg==
--001a114093ced896fe053821b112--
