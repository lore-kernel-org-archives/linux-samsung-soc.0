From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 3/6] drm/exynos: Remove exynos_plane_dpms() call with no
 effect
Date: Fri, 30 Jan 2015 12:36:25 -0200
Message-ID: <20150130143625.GC30820@joana>
References: <1422016980-23806-1-git-send-email-gustavo@padovan.org>
 <1422016980-23806-3-git-send-email-gustavo@padovan.org>
 <54CAE878.7030805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <54CAE878.7030805@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

MjAxNS0wMS0zMCBKb29ueW91bmcgU2hpbSA8ankwOTIyLnNoaW1Ac2Ftc3VuZy5jb20+OgoKPiAr
Q2MgSW5raSwKPiAKPiBIaSwKPiAKPiBPbiAwMS8yMy8yMDE1IDA5OjQyIFBNLCBHdXN0YXZvIFBh
ZG92YW4gd3JvdGU6Cj4gPiBGcm9tOiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3ZhbkBj
b2xsYWJvcmEuY28udWs+Cj4gPiAKPiA+IGV4eW5vc19wbGFuZV9kcG1zKERSTV9NT0RFX0RQTVNf
T04pIGNhbGxzIHRoZSB3aW5fZW5hYmxlKCkncyBjYWxsYmFjawo+ID4gZnJvbSB0aGUgdW5kZXJs
eWluZyBsYXllci4gSG93ZXZlciBuZWl0aGVyIG9uZSBvZiB0aGVzZSBsYXllcnMgaW1wbGVtZW50
Cj4gPiB3aW5fZW5hYmxlKCkgLSBGSU1ELCBNaXhlciBhbmQgVklESS4gVGh1cyB0aGUgY2FsbCB0
byBleHlub3NfcGxhbmVfZHBtcygpCj4gPiBpcyBwb2ludGxlc3MuCj4gPiAKPiAKPiBObywgaXQg
bmVlZHMgZm9yIHBhaXIgd2l0aCBEUk1fTU9ERV9EUE1TX09GRiBjYXNlLgoKSXQgaXMgYSBzdHVi
IGNhbGwuIGV4eW5vc19wbGFuZV9kcG1zKERSTV9NT0RFX0RQTVNfT04pIG9ubHkgY2FsbHMKZXh5
bm9zX2NydGMtPm9wcy0+d2luX2VuYWJsZSgpIGhvd2V2ZXIgbmVpdGhlciBGSU1ELCBWSURJIG9y
IE1peGVyIGltcGxlbWVudHMKd2luX2VuYWJsZSgpLiBTbyBpdCBoYXMgbm8gZWZmZWN0IGFuZCB3
ZSBjYW4gcmVtb3ZlIHRoaXMgY2FsbCBzYWZlbHkuCgoJR3VzdGF2bwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
