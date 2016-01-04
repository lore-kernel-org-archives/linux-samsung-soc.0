From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm/exynos: fix kernel panic issue at drm releasing
Date: Mon, 4 Jan 2016 21:24:02 +0100
Message-ID: <CAPj87rOjMnCRsThp3vjOpik4nYcJdV_M1eEJxTOAUVHA700YCg@mail.gmail.com>
References: <1450948214-14688-1-git-send-email-inki.dae@samsung.com>
 <CAPj87rMUrt55rBSXiFAsJ=vKUjohDmZPeC2CTMbTNAbVkCgYBg@mail.gmail.com>
 <568A5E3A.8090601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <568A5E3A.8090601@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSW5raSwKCk9uIDQgSmFudWFyeSAyMDE2IGF0IDEyOjU3LCBJbmtpIERhZSA8aW5raS5kYWVA
c2Ftc3VuZy5jb20+IHdyb3RlOgo+IDIwMTXrhYQgMTLsm5QgMjTsnbwgMjI6MzLsl5AgRGFuaWVs
IFN0b25lIOydtCjqsIApIOyTtCDquIA6Cj4+IE9uIDI0IERlY2VtYmVyIDIwMTUgYXQgMDk6MTAs
IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4+PiArdm9pZCBleHlub3Nf
ZHJtX2NydGNfY2FuY2VsX3BhZ2VfZmxpcChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCj4+PiArewo+
Pj4gKyAgICAgICBzdHJ1Y3QgZXh5bm9zX2RybV9jcnRjICpleHlub3NfY3J0YyA9IHRvX2V4eW5v
c19jcnRjKGNydGMpOwo+Pj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4gKwo+Pj4g
KyAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrLCBmbGFncyk7
Cj4+PiArICAgICAgIGV4eW5vc19jcnRjLT5ldmVudCA9IE5VTEw7Cj4+PiArICAgICAgIHNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJmNydGMtPmRldi0+ZXZlbnRfbG9jaywgZmxhZ3MpOwo+Pj4gK30K
Pj4KPj4gVGhpcyB3aWxsIGxlYWsgdGhlIGV2ZW50IGFuZCBldmVudCBzcGFjZTsgeW91IHNob3Vs
ZCBjYWxsCj4+IGV2ZW50LT5iYXNlLmRlc3Ryb3koKSBoZXJlLiBXaXRoIHRoYXQgZml4ZWQ6Cj4K
PiBSaWdodC4gd2UgZG9uJ3QgdXNlIGV4eW5vcyBzcGVjaWZpYyBwYWdlIGZsaXAgZnVuY3Rpb24g
YW55bW9yZSB3aGljaCBtYW5hZ2VkIHRoZSBldmVudCBhcyBhIGxpc3Qgc28gdGhhdCB0aGUgZXZl
bnQgb2JqZWN0cyBjYW4gYmUgZnJlZWQgYnkgcG9zdGNsb3NlIGNhbGxiYWNrLgo+IEFueXdheSwg
d291bGQgaXQgYmUgYmV0dGVyIGZvciBldmVudC0+YmFzZS5kZXN0b3J5KCkgdG8gYmUgY2FsbGVk
IGJldHdlZW4gc3BpbiBsb2NrL3VubG9jaz8KCllvdSBtdXN0IGluY3JlbWVudCBldmVudC0+YmFz
ZS5maWxlX3ByaXYtPmV2ZW50X3NwYWNlIChzZWUKZHJtX2F0b21pYy5jOmRlc3Ryb3lfdmJsYW5r
X2V2ZW50KSwgYXMgd2VsbCBhcyBjYWxsaW5nCmV2ZW50LT5iYXNlLmRlc3Ryb3kgKHNlZSBkcm1f
Zm9wcy5jOmRybV9yZWFkKSB1bmRlcm5lYXRoIGV2ZW50X2xvY2ssCnllcy4KCkNoZWVycywKRGFu
aWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
