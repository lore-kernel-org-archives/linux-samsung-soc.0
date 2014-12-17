From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Wed, 17 Dec 2014 13:29:05 +0200
Message-ID: <1865286.bzxN3oUcXS@avalon>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
 <3197445.qizQc0zeRb@avalon> <54914D7D.9060108@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <54914D7D.9060108@collabora.co.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay kumar <ajaynumb@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgSmF2aWVyLAoKT24gV2VkbmVzZGF5IDE3IERlY2VtYmVyIDIwMTQgMTA6MzE6NDEgSmF2aWVy
IE1hcnRpbmV6IENhbmlsbGFzIHdyb3RlOgo+IE9uIDEyLzE2LzIwMTQgMTI6MzcgQU0sIExhdXJl
bnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBIaSBKYXZpZXIsCj4gPiAKPiA+PiBUb21pIGFuZCBMYXVy
ZW50LAo+ID4+IAo+ID4+IFlvdSBhc2tlZCBBamF5IHRvIGNoYW5nZSBoaXMgc2VyaWVzIHRvIHVz
ZSB0aGUgdmlkZW8gcG9ydCBhbmQgZW5wb2ludHMgRFQKPiA+PiBiaW5kaW5ncyBpbnN0ZWFkIG9m
IHBoYW5kbGVzLCBjb3VsZCB5b3UgcGxlYXNlIHJldmlldyBoaXMgbGF0ZXN0IHZlcnNpb24/Cj4g
Pj4gCj4gPj4gSSBndWVzcyBpcyBub3cgdG9vIGxhdGUgZm9yIDMuMTkgc2luY2Ugd2UgYXJlIGlu
IHRoZSBtaWRkbGUgb2YgdGhlIG1lcmdlCj4gPj4gd2luZG93IGJ1dCBpdCB3b3VsZCBiZSBncmVh
dCBpZiB0aGlzIHNlcmllcyBjYW4gYXQgbGVhc3QgbWFkZSBpdCB0byAzLjIwLgo+ID4gCj4gPiBJ
IGRvbid0IGhhdmUgdGltZSB0byByZXZpZXcgdGhlIHNlcmllcyBpbiBkZXRhaWxzIHJpZ2h0IG5v
dywgYnV0IEknbSBoYXBweQo+ID4gd2l0aCB0aGUgRFQgYmluZGluZ3MsIGFuZCBoYXZlIG5vIGJp
ZyBpc3N1ZSB3aXRoIHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzLgo+ID4gSQo+ID4gZG9uJ3QgcmVh
bGx5IGxpa2UgdGhlIG9mX2RybV9maW5kX2JyaWRnZSgpIGNvbmNlcHQgaW50cm9kdWNlZCBpbiAw
My8xNCBidXQKPiA+IEkgd29uJ3QgbmFjayBpdCBnaXZlbiBsYWNrIG9mIHRpbWUgdG8gaW1wbGVt
ZW50IGFuIGFsdGVybmF0aXZlIHByb3Bvc2FsLgo+ID4gSXQncyBhbiBpbnRlcm5hbCBBUEksIGl0
IGNhbiBhbHdheXMgYmUgcmV3b3JrZWQgbGF0ZXIgYW55d2F5Lgo+IAo+IFRoYW5rcyBhIGxvdCBm
b3IgdGFraW5nIHRoZSB0aW1lIHRvIGxvb2sgYXQgdGhlIERUIGJpbmRpbmdzLAoKWW91J3JlIHdl
bGNvbWUuIFNvcnJ5IGZvciB0aGUgbG9uZyBkZWxheS4KCj4gdGhlbiBJIGd1ZXNzIHRoYXQgdGhl
IHNlcmllcyBhcmUgZmluYWxseSByZWFkeSB0byBiZSBtZXJnZWQ/CgpGcm9tIG15IHBvaW50IG9m
IHZpZXcsIHllcy4KCj4gQWpheSdzIHNlcmllcyBkb24ndCBhcHBseSBjbGVhbmx5IGFueW1vcmUg
YmVjYXVzZSBpdCBoYXMgYmVlbiBhIHdoaWxlIHNpbmNlCj4gaGUgcG9zdGVkIGl0IGJ1dCBoZSBj
YW4gcmViYXNlIG9uIHRvcCBvZiAzLjE5LXJjMSBvbmNlIGl0IGlzIHJlbGVhc2VkIGFuZAo+IHJl
LXJlc2VuZC4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
