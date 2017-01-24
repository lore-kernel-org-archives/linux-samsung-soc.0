From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH] drm/bridge: analogix dp: Fix runtime PM state on driver
 bind
Date: Tue, 24 Jan 2017 08:10:18 +0530
Message-ID: <223caf05-800d-8d79-fe69-153fdf0852a6@codeaurora.org>
References: <CGME20161230095831eucas1p2c315f7ca20a49e1a7ad421cc68b1101a@eucas1p2.samsung.com>
 <1483091866-1088-1-git-send-email-m.szyprowski@samsung.com>
 <CAOw6vbJLwm8nx5w6oF4LreLYPi8Mqi5f-W9CrAx8B_7DW6xf-w@mail.gmail.com>
 <5552ad97-2043-8690-dcc9-fd7d4701c947@codeaurora.org>
 <79ce3bb1-3049-fc1c-64a9-2d4ef18981a0@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <79ce3bb1-3049-fc1c-64a9-2d4ef18981a0@osg.samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kevin Hilman <khilman@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Yakir Yang <ykk@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAwMS8yMy8yMDE3IDEwOjU4IFBNLCBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgd3Jv
dGU6Cj4gSGVsbG8gQXJjaGl0LAo+Cj4gT24gMDEvMDkvMjAxNyAwNjo0NyBBTSwgQXJjaGl0IFRh
bmVqYSB3cm90ZToKPj4KPj4KPj4gT24gMDEvMDUvMjAxNyAwMTowMSBQTSwgU2VhbiBQYXVsIHdy
b3RlOgo+Pj4gT24gRnJpLCBEZWMgMzAsIDIwMTYgYXQgNDo1NyBBTSwgTWFyZWsgU3p5cHJvd3Nr
aQo+Pj4gPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4+Pj4gQW5hbG9naXhfZHBf
YmluZCgpIGNhbiBiZSBjYWxsZWQgZnJvbSBjb21wb25lbnQgZnJhbWV3b3JrLCB3aGljaCBkb2Vz
bid0Cj4+Pj4gZ3VhcmFudGVlIHByb3BlciBydW50aW1lIFBNIHN0YXRlIG9mIHRoZSBkZXZpY2Ug
ZHVyaW5nIGJpbmQgb3BlcmF0aW9uLAo+Pj4+IHNvIGVuc3VyZSB0aGF0IGRldmljZSBpcyBydW50
aW1lIGFjdGl2ZSBiZWZvcmUgZG9pbmcgYW55IHJlZ2lzdGVyIGFjY2Vzcy4KPj4+PiBUaGlzIGVu
c3VyZXMgdGhhdCB0aGUgcG93ZXIgZG9tYWluLCB0byB3aGljaCBEUCBtb2R1bGUgYmVsb25ncywg
aXMgdHVybmVkCj4+Pj4gb24uIFdoaWxlIGF0IGl0LCBhbHNvIGZpeCB0aGUgdW5iYWxhbmNlZCBj
YWxsIHRvIHBoeV9wb3dlcl9vbigpIGluCj4+Pj4gYW5hbG9naXhfZHBfYmluZCgpIGZ1bmN0aW9u
Lgo+Pgo+PiBQdXNoZWQgdG8gZHJtLW1pc2MtZml4ZXMuCj4+Cj4KPiBEbyB5b3Uga25vdyB3aGVu
IHRoaXMgZml4IHdpbGwgbGFuZCBpbiBtYWlubGluZT8gVGhlIHJlZ3Jlc3Npb24gaXMgc3RpbGwK
PiBwcmVzZW50IGluIHY0LjEwLXJjNToKPgo+IGh0dHBzOi8vc3RvcmFnZS5rZXJuZWxjaS5vcmcv
bWFpbmxpbmUvdjQuMTAtcmM1L2FybS1leHlub3NfZGVmY29uZmlnL2xhYi1jb2xsYWJvcmEvYm9v
dC1leHlub3M1MjUwLXNub3cuaHRtbAoKSXQncyB0aGVyZSBpbiBEYXZlJ3MgNC4xMC1yYzYgcHVs
bCByZXF1ZXN0OgoKaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTcvMS8yMi8zMDUKQXJjaGl0Cgot
LSAKUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1iZXIgb2YgQ29kZSBB
dXJvcmEgRm9ydW0sCmEgTGludXggRm91bmRhdGlvbiBDb2xsYWJvcmF0aXZlIFByb2plY3QKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
