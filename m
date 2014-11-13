From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/4] drm/exynos/dsi: remove global display variable
Date: Thu, 13 Nov 2014 17:50:04 +0900
Message-ID: <546470BC.4020104@samsung.com>
References: <1412683271-15835-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1412683271-15835-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNOuFhCAxMOyblCAwN+ydvCAyMTowMSwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBIaSBJ
bmtpLAo+IAo+IE1hbnkgRXh5bm9zIERSTSBkcml2ZXJzIHVzZXMgZ2xvYmFsIHZhcmlhYmxlcyB0
byByZXByZXNlbnQgYXNzb2NpYXRlZCBkZXZpY2VzCj4gaW4gRXh5bm9zIERSTSBpbnRlcm5hbCBm
cmFtZXdvcmsuIEl0IGlzIHF1aXRlIGNvbmZ1c2luZywgaXQgYWRkcyBkYXRhIGR1cGxpY2F0aW9u
Cj4gYW5kIGZpbmFsbHkgaXQgZG9lcyBub3QgYWxsb3cgdG8gaGFuZGxlIG1vcmUgdGhhbiBvbmUg
ZGV2aWNlIGluIHN5c3RlbS4KPiBJdCBzZWVtcyBiZXR0ZXIgdG8gZW1iZWQgc3VjaCBzdHJ1Y3R1
cmVzIGluIHByaXZhdGUgY29udGV4dCBvZiB0aGUgZGV2aWNlLgo+IAo+IFRoZSBwYXRjaHNldCBp
cyBiYXNlZCBvbiBleHlub3NfZHJtX25leHQgcGx1cyBteSBwYXRjaCBbMV06Cj4gJ2RybS9leHlu
b3M6IHJlbW92ZSBleHBsaWNpdCBlbmNvZGVyL2Nvbm5lY3RvciBkZS1pbml0aWFsaXphdGlvbicu
Cj4gCj4gSWYgdGhlIHBhdGNoc2V0IGlzIE9LIGZvciB5b3UgSSBjYW4gcHJlcGFyZSBzaW1pbGFy
IHBhdGNoZXMgZm9yIG90aGVyIEV4eW5vcyBEUk0gY29tcG9uZW50cy4KClNvcnJ5IGZvciBsYXRl
LiBBcHBsaWVkLiBDYW4geW91IHByZXBhcmUgc2ltaWxhciBwYXRjaGVzIGZvciBvdGhlcj8gSWYK
c28sIEknZCBoYXBweS4KClRoYW5rcywKSW5raSBEYWUKCj4gCj4gWzFdOiBodHRwczovL2xrbWwu
b3JnL2xrbWwvMjAxNC85LzIyLzE0OAo+IAo+IFJlZ2FyZHMKPiBBbmRyemVqCj4gCj4gCj4gQW5k
cnplaiBIYWpkYSAoNCk6Cj4gICBkcm0vZXh5bm9zL2RzaTogcmVtb3ZlIGdsb2JhbCB2YXJpYWJs
ZSBleHlub3NfZHNpX2Rpc3BsYXkKPiAgIGRybS9leHlub3MvZHNpOiBzaW1wbGlmeSBkZXZpY2Ug
cG9pbnRlciBldmFsdWF0aW9uCj4gICBkcm0vZXh5bm9zL2RzaTogcmVtb3ZlIHJlZHVuZGFudCBl
bmNvZGVyIGZpZWxkCj4gICBkcm0vZXh5bm9zL2RzaTogc3RvcCB1c2luZyBkaXNwbGF5LT5jdHgg
cG9pbnRlcgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgfCA5
NiArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ3
IGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
