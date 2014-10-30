From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 0/4] drm/exynos/dsi: remove global display variable
Date: Thu, 30 Oct 2014 13:39:40 +0100
Message-ID: <5452318C.1030107@samsung.com>
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
To: Inki Dae <inki.dae@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTAvMDcvMjAxNCAwMjowMSBQTSwgQW5kcnplaiBIYWpkYSB3cm90ZToKPiBIaSBJbmtpLAo+
Cj4gTWFueSBFeHlub3MgRFJNIGRyaXZlcnMgdXNlcyBnbG9iYWwgdmFyaWFibGVzIHRvIHJlcHJl
c2VudCBhc3NvY2lhdGVkIGRldmljZXMKPiBpbiBFeHlub3MgRFJNIGludGVybmFsIGZyYW1ld29y
ay4gSXQgaXMgcXVpdGUgY29uZnVzaW5nLCBpdCBhZGRzIGRhdGEgZHVwbGljYXRpb24KPiBhbmQg
ZmluYWxseSBpdCBkb2VzIG5vdCBhbGxvdyB0byBoYW5kbGUgbW9yZSB0aGFuIG9uZSBkZXZpY2Ug
aW4gc3lzdGVtLgo+IEl0IHNlZW1zIGJldHRlciB0byBlbWJlZCBzdWNoIHN0cnVjdHVyZXMgaW4g
cHJpdmF0ZSBjb250ZXh0IG9mIHRoZSBkZXZpY2UuCgpHZW50bHkgcGluZy4KClJlZ2FyZHMKQW5k
cnplagoKPgo+IFRoZSBwYXRjaHNldCBpcyBiYXNlZCBvbiBleHlub3NfZHJtX25leHQgcGx1cyBt
eSBwYXRjaCBbMV06Cj4gJ2RybS9leHlub3M6IHJlbW92ZSBleHBsaWNpdCBlbmNvZGVyL2Nvbm5l
Y3RvciBkZS1pbml0aWFsaXphdGlvbicuCj4KPiBJZiB0aGUgcGF0Y2hzZXQgaXMgT0sgZm9yIHlv
dSBJIGNhbiBwcmVwYXJlIHNpbWlsYXIgcGF0Y2hlcyBmb3Igb3RoZXIgRXh5bm9zIERSTSBjb21w
b25lbnRzLgo+Cj4gWzFdOiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxNC85LzIyLzE0OAo+Cj4g
UmVnYXJkcwo+IEFuZHJ6ZWoKPgo+Cj4gQW5kcnplaiBIYWpkYSAoNCk6Cj4gICBkcm0vZXh5bm9z
L2RzaTogcmVtb3ZlIGdsb2JhbCB2YXJpYWJsZSBleHlub3NfZHNpX2Rpc3BsYXkKPiAgIGRybS9l
eHlub3MvZHNpOiBzaW1wbGlmeSBkZXZpY2UgcG9pbnRlciBldmFsdWF0aW9uCj4gICBkcm0vZXh5
bm9zL2RzaTogcmVtb3ZlIHJlZHVuZGFudCBlbmNvZGVyIGZpZWxkCj4gICBkcm0vZXh5bm9zL2Rz
aTogc3RvcCB1c2luZyBkaXNwbGF5LT5jdHggcG9pbnRlcgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9kc2kuYyB8IDk2ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0p
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
