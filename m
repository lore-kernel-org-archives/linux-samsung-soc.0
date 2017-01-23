From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v2] drm/exynos: use atomic helper commit
Date: Mon, 23 Jan 2017 17:01:56 +0100
Message-ID: <588628F4.50808@math.uni-bielefeld.de>
References: <CGME20170119101840epcas5p36732799cf9d707abdf6a8f07e5169131@epcas5p3.samsung.com>
 <1484821118-10479-1-git-send-email-inki.dae@samsung.com>
 <5880B5E8.4000309@math.uni-bielefeld.de> <5881874A.5050506@samsung.com>
 <58820B33.8050107@math.uni-bielefeld.de> <5885C63B.7060606@samsung.com>
 <5885FABB.20909@math.uni-bielefeld.de>
 <20170123145506.GA17868@trickycodes.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170123145506.GA17868@trickycodes.roam.corp.google.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

U2VhbiBQYXVsIHdyb3RlOgo+IDxzbmlwPgo+IAo+Pj4+PiBBcyBvZiBub3csIEkgZG9uJ3Qgc2Vl
IGFueSBjYXNlLiBldmVuIHdpdGhvdXQgTWFhcnRlbidzIHBhdGNoIHNldCwgaXQgd29ya3Mgd2Vs
bCAtIGFjdHVhbGx5LCBJIGhhZCBhIHRlc3Qgd2l0aCBhdG9taWMgdGVzdCBhcHAgbW9yZSB0aGFu
IDEwIGhvdXJzLi4KPj4+PiBDYW4geW91IHByb3ZpZGUgdGhpcyB0ZXN0IGFwcGxpY2F0aW9uPyBJ
biBwYXJ0aWN1bGFyIEknbSBhc2tpbmcgdGhpcwo+Pj4+IGJlY2F1c2UgbGliZHJtIGN1cnJlbnRs
eSBkb2Vzbid0IHByb3ZpZGUgYW55IHRlc3RzIHVzaW5nIHRoZSBhdG9taWMgQVBJLgo+Pj4+IFNv
IHRoaXMgYXBwbGljYXRpb24gbWlnaHQgYmUgb2YgaW50ZXJlc3QgYWxzbyBmb3Igb3RoZXIgcGVv
cGxlLgo+Pj4KPj4+IEJlbG93IGlzIHRoZSBhcHAgSSB0ZXN0ZWQuIEtub3cgdGhhdCB0aGlzIGFw
cGxpY2F0aW9uIGlzIGZyb20gY2hyb21pdW1PUyB0cmVlIGFuZCBJIGp1c3QgZml4ZWQgc29tZSBw
YXJ0cyBmb3IgaW50ZXJuYWwgdGVzdC4KPj4+IGh0dHBzOi8vcmV2aWV3LnRpemVuLm9yZy9naXQv
P3A9YXRmb3JtL3Vwc3RyZWFtL2xpYmRybS5naXQ7YT1jb21taXRkaWZmO2jvv70zYmQ5NWYyYzVh
OWI0YjY5MDYyYTNmZjAwODk0NzA1NGI5NGY1NQo+PiBUaGFua3MsIGFueSBjaGFuY2UgdGhpcyBp
cyBnb2luZyB0byBiZSBzdWJtaXR0ZWQgdXBzdHJlYW0/Cj4+Cj4gCj4gUHJvYmFibHkgbm90IGlu
IGl0cyBjdXJyZW50IGZvcm0uIEkganVzdCB3cm90ZSBpdCB0byBxdWlja2x5IHRlc3Qgb3V0Cj4g
c29tZSBzdHVmZiB3ZSBkaWRuJ3QgeWV0IHN1cHBvcnQgaW4gQ3JPUy4gSSBkb24ndCByZWFsbHkg
dGhpbmsgaXQncyBmaXQKPiBmb3IgaW5jbHVzaW9uIHVwc3RyZWFtLgpUaGFua3MgZm9yIHRoZSBj
bGFyaWZpY2F0aW9uISBKdXN0IHZvaWNpbmcgbXkgaW50ZXJlc3QgaGVyZSB0byBoYXZlCnNvbWV0
aGluZyBsaWtlIHRoaXMgdXBzdHJlYW0uIEkgbWVhbiB3aXRoIGF0b21pYyBub3cgYmVpbmcgbWFu
ZGF0b3J5IGZvcgpuZXcgRFJNIGtlcm5lbCBkcml2ZXJzIGFuZCBhbGwuLi4gOi0pCgotIFRvYmlh
cwoKCj4gCj4gU2Vhbgo+IAo+IDxzbmlwPgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
