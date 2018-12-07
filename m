From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 0/3] drm/exynos: add support for dynamic zpos in DECON
 and FIMD
Date: Fri, 7 Dec 2018 10:18:45 +0900
Message-ID: <537890af-ceab-592e-b1fc-09d853f6efda@samsung.com>
References: <CGME20181206093905eucas1p133ead84adfb9dd7a9756ce91b6b35895@eucas1p1.samsung.com>
 <20181206093857.22324-1-a.hajda@samsung.com>
 <ad1512ce-2f95-d411-8d2c-1c7fe10e96a3@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ad1512ce-2f95-d411-8d2c-1c7fe10e96a3@samsung.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgQW5kcnplaiwKCjE4LiAxMi4gNi4g7Jik7ZuEIDg6MDbsl5AgQW5kcnplaiBIYWpkYSDsnbQo
6rCAKSDsk7Qg6riAOgo+IEhpIElua2ksCj4gCj4gT24gMDYuMTIuMjAxOCAxMDozOCwgQW5kcnpl
aiBIYWpkYSB3cm90ZToKPj4gSGkgSW5raSwKPj4KPj4gVGhpcyBzbWFsbCBwYXRjaHNldCBhZGRz
IGR5bmFtaWMgenBvcyBzdXBwb3J0IGZvciBERUNPTiBhbmQgRklNRC4KPj4gSXQgd2FzIHRlc3Rl
ZCBvbiB0bTIgYW5kIHRyYXRzMi4KPiAKPiAKPiBJIGhhdmUgcmVhbGl6ZWQgdGhhdCB0aGlzIHBh
dGNoc2V0IGludGVyZmVyZXMgd2l0aCBDaHJpc3RvcGgncyBleHlub3MKPiBwbGFuZSBwYXRjaGVz
IGZvciBmaW1kIGFuZCBkZWNvbiwgYnV0IGluIGRybS1leHlub3MvZXh5bm9zX2RybV9uZXh0IEkK
PiBoYXZlIGZvdW5kIG9ubHkgcGF0Y2hlcyBmb3IgZGVjb24uIERvIHlvdSBwbGFuIHRvIGdldCBD
aHJpc3Rwb3BoJ3MKPiBhbHBoYS9ibGVuZGluZyBwYXRjaGVzIGZvciBmaW1kPwo+IAo+IFNob3Vs
ZCBJIHJlYmFzZSBteSBwYXRjaGVzIG9uIGN1cnJlbnQgZXh5bm9zLWRybS1uZXh0LCBvciBvbiBh
bGwKPiBDaHJpc3RvcGgncyBwYXRjaGVzPwoKSSBtaXNzZWQgdG8gbWVyZ2UgQ2hyaXN0b3BoJ3Mg
cGF0Y2hlcy4gVGhhbmtzIGZvciBub3RpY2UuCk5vdyB5b3UgY2FuIHJlYmFzZSB5b3VyIHBhdGNo
IG9uIHRvcCBvZiBleHlub3MtZHJtLW5leHQuCgpUaGFua3MsCklua2kgRGFlCgo+IAo+IAo+IFJl
Z2FyZHMKPiAKPiBBbmRyemVqCj4gCj4gCj4+Cj4+IFJlZ2FyZHMKPj4gQW5kcnplago+Pgo+Pgo+
PiBBbmRyemVqIEhhamRhICgzKToKPj4gICBkcm0vZXh5bm9zL2RlY29uNTQzMzogYWRkIGR5bmFt
aWMgenBvcyBzdXBwb3J0Cj4+ICAgZHJtL2V4eW5vcy9maW1kOiBjcmVhdGUgbG9jYWwgaGVscGVy
IGZvciBkaXNhYmxpbmcgaGFyZHdhcmUgd2luZG93Cj4+ICAgZHJtL2V4eW5vcy9maW1kOiBhZGQg
ZHluYW1pYyB6cG9zIHN1cHBvcnQKPj4KPj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
NTQzM19kcm1fZGVjb24uYyB8IDIzICsrKysrLS0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9maW1kLmMgICAgICB8IDQyICsrKysrKysrLS0tLS0tLS0tLS0KPj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCj4+Cj4gCj4g
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
