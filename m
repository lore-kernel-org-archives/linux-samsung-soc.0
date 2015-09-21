From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 0/9] drm/exynos: rewrite fimg2d error handling
Date: Mon, 21 Sep 2015 17:36:58 +0100
Message-ID: <CACvgo51rc1QC=EaGqb1Zq5T=j8R91CXq+KA_W24vKVG8sqZ5uQ@mail.gmail.com>
References: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgVG9iaWFzLAoKT24gOCBTZXB0ZW1iZXIgMjAxNSBhdCAxNjoyMiwgVG9iaWFzIEpha29iaQo8
dGpha29iaUBtYXRoLnVuaS1iaWVsZWZlbGQuZGU+IHdyb3RlOgo+IEhlbGxvLAo+Cj4gZHVyaW5n
IHRoZSBkaXNjdXNzaW9uIGFib3V0IHRoZSBsYXN0IHBhdGNoc2V0IHRvdWNoaW5nIHRoZQo+IGZp
bWcyZCBjb2RlLCBpdCBiZWNhbWUgYXBwYXJlbnQgdGhhdCB0aGUgZXJyb3IgaGFuZGxpbmcgZm9y
Cj4gdGhlIGNvbW1hbmQgc3VibWlzc2lvbiBpcyBjdXJyZW50bHkgdW5zYXRpc2ZhY3RvcnkuCj4K
PiBUaGlzIHNlcmllcyByZXdyaXRlcyB0aGUgaGFuZGxpbmcuIEFsbCBmdW5jdGlvbnMgdGhhdCBz
dWJtaXQKPiBjb21tYW5kIGJ1ZmZlcnMgbm93IGZpcnN0IGNoZWNrIGlmIGVub3VnaCBzcGFjZSBp
cyBhdmFpbGFibGUKPiBhbmQgb25seSB0aGVuIHByb2NlZWQgdG8gYnVpbGQgdGhlIGNvbW1hbmQg
YnVmZmVycy4KPgo+IEluIHBhcnRpY3VsYXIgdGhlIGNvbW1hbmQgYnVmZmVyIGlzIG5vIGxvbmdl
ciBsZWZ0IGluIGEKPiBoYWxmLWZpbmlzaGVkIHN0YXRlLCBzaW5jZSBwYXJhbWV0ZXJzIHBhc3Nl
ZCB0byB0aGUgZnVuY3Rpb25zCj4gYXJlIG5vdyB2YWxpZGF0ZWQgYmVmb3JlIGNvbW1hbmQgc3Vi
bWlzc2lvbi4gRm9yIHRoaXMgc29tZQo+IHZhbGlkYXRpb24gZnVuY3Rpb25zIGFyZSBpbnRyb2R1
Y2VkLgo+Cj4gVGhpcyBzaG91bGQgYWxzbyBpbmNyZWFzZSBwZXJmb3JtYW5jZSBpZiB0aGUgYm90
dGxlbmVjayBpcwo+IHRoZSBzdWJtaXNzaW9uIHBhcnQsIHNpbmNlIGFkZGluZyBjb21tYW5kcyB0
byB0aGUgYnVmZmVyCj4gaXMgbm93IG1vcmUgbGlnaHR3ZWlnaHQuCj4KPiBMYXN0IGJ1dCBub3Qg
bGVhc3Qgc29tZSBwcmVmaXggd2FzIGFkZGVkIHRvIG1lc3NhZ2VzIHByaW50ZWQKPiBieSBmcHJp
bnRmIGFuZCBwcmludGYsIGFuZCB0aGUgRzJEIGNvbnRleHQgc3RydWN0IHdhcyBtb3ZlZAo+IG91
dCBvZiB0aGUgcHVibGljIGhlYWRlci4KPgo+Cj4gUGxlYXNlIHJldmlldyBhbmQgbGV0IG1lIGtu
b3cgaWYgSSBjYW4gaW1wcm92ZSBhbnl0aGluZyEKPgpDb25zaWRlcmluZyB0aGF0IHRoZXJlIHdl
cmUgbm8gbW9yZSBvYmplY3Rpb25zIHdpdGggdGhlIHNlcmllcyBJJ3ZlCnNjb29wZWQgdGhlbSB1
cC4KClRoYW5rcyBmb3IgY2xlYXJpbmcgdGhpcyBhbmQgc3RpY2tpbmcgYXJvdW5kICEKRW1pbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
