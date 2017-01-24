From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] drm/bridge: analogix dp: Fix runtime PM state on driver
 bind
Date: Tue, 24 Jan 2017 09:16:42 -0300
Message-ID: <675368e6-900a-e71d-4223-337cbc725332@osg.samsung.com>
References: <CGME20161230095831eucas1p2c315f7ca20a49e1a7ad421cc68b1101a@eucas1p2.samsung.com>
 <1483091866-1088-1-git-send-email-m.szyprowski@samsung.com>
 <CAOw6vbJLwm8nx5w6oF4LreLYPi8Mqi5f-W9CrAx8B_7DW6xf-w@mail.gmail.com>
 <5552ad97-2043-8690-dcc9-fd7d4701c947@codeaurora.org>
 <79ce3bb1-3049-fc1c-64a9-2d4ef18981a0@osg.samsung.com>
 <223caf05-800d-8d79-fe69-153fdf0852a6@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <223caf05-800d-8d79-fe69-153fdf0852a6@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kevin Hilman <khilman@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Yakir Yang <ykk@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gQXJjaGl0LAoKT24gMDEvMjMvMjAxNyAxMTo0MCBQTSwgQXJjaGl0IFRhbmVqYSB3cm90
ZToKPiBIaSwKPiAKPiBPbiAwMS8yMy8yMDE3IDEwOjU4IFBNLCBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgd3JvdGU6Cj4+IEhlbGxvIEFyY2hpdCwKPj4KPj4gT24gMDEvMDkvMjAxNyAwNjo0NyBB
TSwgQXJjaGl0IFRhbmVqYSB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMDEvMDUvMjAxNyAwMTowMSBQ
TSwgU2VhbiBQYXVsIHdyb3RlOgo+Pj4+IE9uIEZyaSwgRGVjIDMwLCAyMDE2IGF0IDQ6NTcgQU0s
IE1hcmVrIFN6eXByb3dza2kKPj4+PiA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPiB3cm90ZToK
Pj4+Pj4gQW5hbG9naXhfZHBfYmluZCgpIGNhbiBiZSBjYWxsZWQgZnJvbSBjb21wb25lbnQgZnJh
bWV3b3JrLCB3aGljaCBkb2Vzbid0Cj4+Pj4+IGd1YXJhbnRlZSBwcm9wZXIgcnVudGltZSBQTSBz
dGF0ZSBvZiB0aGUgZGV2aWNlIGR1cmluZyBiaW5kIG9wZXJhdGlvbiwKPj4+Pj4gc28gZW5zdXJl
IHRoYXQgZGV2aWNlIGlzIHJ1bnRpbWUgYWN0aXZlIGJlZm9yZSBkb2luZyBhbnkgcmVnaXN0ZXIg
YWNjZXNzLgo+Pj4+PiBUaGlzIGVuc3VyZXMgdGhhdCB0aGUgcG93ZXIgZG9tYWluLCB0byB3aGlj
aCBEUCBtb2R1bGUgYmVsb25ncywgaXMgdHVybmVkCj4+Pj4+IG9uLiBXaGlsZSBhdCBpdCwgYWxz
byBmaXggdGhlIHVuYmFsYW5jZWQgY2FsbCB0byBwaHlfcG93ZXJfb24oKSBpbgo+Pj4+PiBhbmFs
b2dpeF9kcF9iaW5kKCkgZnVuY3Rpb24uCj4+Pgo+Pj4gUHVzaGVkIHRvIGRybS1taXNjLWZpeGVz
Lgo+Pj4KPj4KPj4gRG8geW91IGtub3cgd2hlbiB0aGlzIGZpeCB3aWxsIGxhbmQgaW4gbWFpbmxp
bmU/IFRoZSByZWdyZXNzaW9uIGlzIHN0aWxsCj4+IHByZXNlbnQgaW4gdjQuMTAtcmM1Ogo+Pgo+
PiBodHRwczovL3N0b3JhZ2Uua2VybmVsY2kub3JnL21haW5saW5lL3Y0LjEwLXJjNS9hcm0tZXh5
bm9zX2RlZmNvbmZpZy9sYWItY29sbGFib3JhL2Jvb3QtZXh5bm9zNTI1MC1zbm93Lmh0bWwKPiAK
PiBJdCdzIHRoZXJlIGluIERhdmUncyA0LjEwLXJjNiBwdWxsIHJlcXVlc3Q6Cj4gCj4gaHR0cHM6
Ly9sa21sLm9yZy9sa21sLzIwMTcvMS8yMi8zMDUKClRoYW5rcyBhIGxvdCBmb3IgdGhlIGluZm9y
bWF0aW9uLgoKPiBBcmNoaXQKPiAKCkJlc3QgcmVnYXJkcywKLS0gCkphdmllciBNYXJ0aW5leiBD
YW5pbGxhcwpPcGVuIFNvdXJjZSBHcm91cApTYW1zdW5nIFJlc2VhcmNoIEFtZXJpY2EKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
