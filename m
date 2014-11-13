From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 0/4] drm/exynos/dsi: remove global display variable
Date: Thu, 13 Nov 2014 15:14:22 +0100
Message-ID: <5464BCBE.1090001@samsung.com>
References: <1412683271-15835-1-git-send-email-a.hajda@samsung.com>
 <546470BC.4020104@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <546470BC.4020104@samsung.com>
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
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTEvMTMvMjAxNCAwOTo1MCBBTSwgSW5raSBEYWUgd3JvdGU6Cj4gT24gMjAxNOuFhCAxMOyb
lCAwN+ydvCAyMTowMSwgQW5kcnplaiBIYWpkYSB3cm90ZToKPj4gSGkgSW5raSwKPj4KPj4gTWFu
eSBFeHlub3MgRFJNIGRyaXZlcnMgdXNlcyBnbG9iYWwgdmFyaWFibGVzIHRvIHJlcHJlc2VudCBh
c3NvY2lhdGVkIGRldmljZXMKPj4gaW4gRXh5bm9zIERSTSBpbnRlcm5hbCBmcmFtZXdvcmsuIEl0
IGlzIHF1aXRlIGNvbmZ1c2luZywgaXQgYWRkcyBkYXRhIGR1cGxpY2F0aW9uCj4+IGFuZCBmaW5h
bGx5IGl0IGRvZXMgbm90IGFsbG93IHRvIGhhbmRsZSBtb3JlIHRoYW4gb25lIGRldmljZSBpbiBz
eXN0ZW0uCj4+IEl0IHNlZW1zIGJldHRlciB0byBlbWJlZCBzdWNoIHN0cnVjdHVyZXMgaW4gcHJp
dmF0ZSBjb250ZXh0IG9mIHRoZSBkZXZpY2UuCj4+Cj4+IFRoZSBwYXRjaHNldCBpcyBiYXNlZCBv
biBleHlub3NfZHJtX25leHQgcGx1cyBteSBwYXRjaCBbMV06Cj4+ICdkcm0vZXh5bm9zOiByZW1v
dmUgZXhwbGljaXQgZW5jb2Rlci9jb25uZWN0b3IgZGUtaW5pdGlhbGl6YXRpb24nLgo+Pgo+PiBJ
ZiB0aGUgcGF0Y2hzZXQgaXMgT0sgZm9yIHlvdSBJIGNhbiBwcmVwYXJlIHNpbWlsYXIgcGF0Y2hl
cyBmb3Igb3RoZXIgRXh5bm9zIERSTSBjb21wb25lbnRzLgo+IFNvcnJ5IGZvciBsYXRlLiBBcHBs
aWVkLiBDYW4geW91IHByZXBhcmUgc2ltaWxhciBwYXRjaGVzIGZvciBvdGhlcj8gSWYKPiBzbywg
SSdkIGhhcHB5LgoKQmVnaW5uaW5nIG9mIHRoZSBuZXh0IHdlZWsgaXMgT0s/CgpSZWdhcmRzCkFu
ZHJ6ZWoKCj4KPiBUaGFua3MsCj4gSW5raSBEYWUKPgo+PiBbMV06IGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDE0LzkvMjIvMTQ4Cj4+Cj4+IFJlZ2FyZHMKPj4gQW5kcnplago+Pgo+Pgo+PiBBbmRy
emVqIEhhamRhICg0KToKPj4gICBkcm0vZXh5bm9zL2RzaTogcmVtb3ZlIGdsb2JhbCB2YXJpYWJs
ZSBleHlub3NfZHNpX2Rpc3BsYXkKPj4gICBkcm0vZXh5bm9zL2RzaTogc2ltcGxpZnkgZGV2aWNl
IHBvaW50ZXIgZXZhbHVhdGlvbgo+PiAgIGRybS9leHlub3MvZHNpOiByZW1vdmUgcmVkdW5kYW50
IGVuY29kZXIgZmllbGQKPj4gICBkcm0vZXh5bm9zL2RzaTogc3RvcCB1c2luZyBkaXNwbGF5LT5j
dHggcG9pbnRlcgo+Pgo+PiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5j
IHwgOTYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgNDcgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCj4+Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
