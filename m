From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH V7 03/12] drm/bridge: Add helper functions for drm_bridge
Date: Mon, 27 Oct 2014 23:20:31 +0100
Message-ID: <CAKMK7uEch65=ZuaG=4JY2u3S3w5RND+uNc5+qL=tWxDLfEqEwQ@mail.gmail.com>
References: <1409149783-12416-1-git-send-email-ajaykumar.rs@samsung.com>
 <1409149783-12416-4-git-send-email-ajaykumar.rs@samsung.com>
 <20141027190137.GT26941@phenom.ffwll.local>
 <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOw6vbLNOqp=X4epwDPb7zT-j2+oUuLoeV2S=x+oGPLQwK+Z7Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gTW9uLCBPY3QgMjcsIDIwMTQgYXQgODo1OCBQTSwgU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+Pj4gQEAgLTY2MCw4ICs2NjIsMTEgQEAgc3RydWN0IGRybV9icmlk
Z2VfZnVuY3Mgewo+Pj4gICAqIEBkcml2ZXJfcHJpdmF0ZTogcG9pbnRlciB0byB0aGUgYnJpZGdl
IGRyaXZlcidzIGludGVybmFsIGNvbnRleHQKPj4+ICAgKi8KPj4+ICBzdHJ1Y3QgZHJtX2JyaWRn
ZSB7Cj4+PiAtICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2Owo+Pj4gKyAgICAgc3RydWN0IGRl
dmljZSAqZGV2Owo+Pgo+PiBQbGVhc2UgZG9uJ3QgcmVuYW1lIHRoZSAtPmRldiBwb2ludGVyIGlu
dG8gZHJtLiBCZWNhdXNlIF9hbGxfIHRoZSBvdGhlcgo+PiBkcm0gc3RydWN0dXJlcyBzdGlsbCBj
YWxsIGl0IC0+ZGV2LiBBbHNvLCBjYW4ndCB3ZSB1c2Ugc3RydWN0IGRldmljZV9ub2RlCj4+IGhl
cmUgbGlrZSB3ZSBkbyBpbiB0aGUgb2YgaGVscGVycyBSdXNzZWxsIGFkZGVkPyBTZWUgN2U0MzVh
YWQzODA4Mwo+Pgo+Cj4gSSB0aGluayB0aGlzIGlzIG1vZGVsZWQgYWZ0ZXIgdGhlIG5hbWluZyBp
biBkcm1fcGFuZWwsIEZXSVcuIEhvd2V2ZXIsCj4gc2VlbXMgcmVhc29uYWJsZSB0byBrZWVwIHRo
ZSBkZXZpY2Vfbm9kZSBpbnN0ZWFkLgoKSG0sIGluZGVlZC4gVGJoIEkgdm90ZSB0byByZW5hbWUg
ZHJtX3BhbmVsLT5kcm0gdG8gLT5kZXYgYW5kIGxpa2Ugd2l0aApkcm1fY3J0YyBkcm9wIHRoZSBz
dHJ1Y3QgZGV2aWNlIGFuZCBnbyBkaXJlY3RseSB0byBhIHN0cnVjdApkZXZpY2Vfbm9kZS4gU2lu
Y2Ugd2UgZG9uJ3QgcmVhbGx5IG5lZWQgdGhlIHN0dXJjdCBkZXZpY2UsIHRoZSBvbmx5CnRoaW5n
IHdlIGNhcmUgYWJvdXQgaXMgdGhlIG9mX25vZGUuIEZvciBhZGRlZCBib251cyB3cmFwIGFuICNp
ZmRlZgpDT05GSUdfT0YgYXJvdW5kIGFsbCB0aGUgdmFyaW91cyBzdHJ1Y3QgZGV2aWNlX25vZGUg
aW4gZHJtX2Zvby5oLgpTaG91bGQgYmUgYWxsIGZhaXJseSBzaW1wbGUgdG8gcHVsbCBvZmYgd2l0
aCBjb2NjaS4KClRoaWVycnk/Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
