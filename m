From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 03/14] drm/bridge: make bridge registration independent of
 drm flow
Date: Fri, 30 Jan 2015 16:08:04 +0000
Message-ID: <CAPj87rMXRGB48k_jnfuxNUh4W6JP63vb4Ak1bkFoNj8wSmq+Tw@mail.gmail.com>
References: <1421771935-31618-1-git-send-email-ajaykumar.rs@samsung.com>
 <1421771935-31618-4-git-send-email-ajaykumar.rs@samsung.com>
 <CAF6AEGs8GbgYMLmaPjGnXAv=Gsf6gMhNj+Zt0-2GKHOnHv4d4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAF6AEGs8GbgYMLmaPjGnXAv=Gsf6gMhNj+Zt0-2GKHOnHv4d4Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, jg1.han@samsung.com, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Ajay kumar <ajaynumb@gmail.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAzMCBKYW51YXJ5IDIwMTUgYXQgMTU6MzcsIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gb2ssIHNvIEkgcHJvYmFibHkgc2hvdWxkIGhhdmUgaGFkIGEgY2xv
c2VyIGxvb2sgYXQgdGhpcyBiZWZvcmUgaXQKPiBsYW5kZWQgaW4gZHJtLW5leHQsIHNvIGlmIGl0
IGlzIHRvbyBsYXRlIHRvIHJldmVydCAoYW5kIGRlYWwgdy8KPiB1bnRhbmdsaW5nIHN1YnNlcXVl
bnQgcGF0Y2hlcyB0aGF0IGRlcGVuZCBvbiB0aGlzKSBzb21lIG9mIHRoZXNlCj4gaXNzdWVzIHdl
J2xsIGp1c3QgaGF2ZSB0byBmaXggd2l0aCBmb2xsb3ctb24gcGF0Y2hlcy4KPgo+IDEpIG5lZWRz
IGhlYWRlcmRvYyBmb3IgbmV3IGZ4bnMgaW4gZHJtX2JyaWRnZS5jLCBhbmQgbmVlZHMgdG8gYmUg
YWRkZWQKPiBpbiBkcm0udG1wbAo+IDIpIGFzIGZhciBhcyBJIGNhbiB0ZWxsLCB0aGUgbmV3IGFw
cHJvYWNoIHRvIGNsZWFuaW5nIHVwIGJyaWRnZQo+IG9iamVjdHMgaXMgdG8ganVzdCBsZXQgdGhl
bSBsZWFrICE/IQo+Cj4gSSdsbCBhbHNvIG5lZWQgdG8gdXBkYXRlIHRoZSBuZXcgYnJpZGdlIGlu
IHRoZSBtc20gZWRwIGNvZGUuLgo+IGFsdGhvdWdoIHRoYXQgaXNuJ3Qgc3VjaCBhIGJpZyBkZWFs
IGlmIEkga25ldyBob3cgdGhpcyB3YXMgKnN1cHBvc2VkKgo+IHRvIHdvcmsuLiBzaW5jZSB3aGF0
IGlzIHRoZXJlIG5vdyBhdCBsZWFzdCBkb2Vzbid0IGxvb2sgcmlnaHQuLgoKR2l2ZW4gaG93IGxv
bmcgdGhlc2UgcGF0Y2hlcyBzYXQgYXJvdW5kIGRvaW5nIGJlaW5nIHBhc3NpdmVseSBOQUNLZWQK
YnkgZGlzY3Vzc2lvbnMgZ29pbmcgYXJvdW5kIGluIGNpcmNsZXMsIGFuZCBob3cgdXNlZnVsIHRo
ZXkgYXJlLCBJJ2QKYmUgbXVjaCBtb3JlIGluIGZhdm91ciBvZiBmaXhpbmcgdGhlbSB1cCB0aGFu
IHJldmVydGluZyBhbmQgZ29pbmcKdGhyb3VnaCB0aGUgd2hvbGUgY2lyY3VzIGFnYWluIC4uLgoK
Q2hlZXJzLApEYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
