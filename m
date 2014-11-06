From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm/exynos: resolve infinite loop issue on non
 multi-platform
Date: Thu, 06 Nov 2014 15:46:47 +0000
Message-ID: <545B97E7.2000004@gmail.com>
References: <1415283007-10096-1-git-send-email-inki.dae@samsung.com>
 <545B976D.3000009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <545B976D.3000009@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>, linux-samsung-soc@vger.kernel.org, emil.l.velikov@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDYvMTEvMTQgMTU6NDQsIEVtaWwgVmVsaWtvdiB3cm90ZToKPiBIaSBJbmtpLAo+IAo+IFdp
dGggYWxsIHJlc3BlY3QsCj4gCj4gT24gMDYvMTEvMTQgMTQ6MTAsIElua2kgRGFlIHdyb3RlOj4g
VGhpcyBwYXRjaCByZXNvdmxlcyB0aGUgaW5maW5pdGUKPiBsb29wIGlzc3VlIGluY3VycmVkCj4+
IHdoZW4gRXh5bm8gZHJtIGRyaXZlciBpcyBlbmFibGVkIGJ1dCBhbGwga21zIGRyaXZlcnMKPj4g
YXJlIGRpc2FibGVkIG9uIEV4eW5vcyBib2FyZCBieSByZXR1cm5pbmcgLUVQUk9CRV9ERUZFUgo+
PiBvbmx5IGluIGNhc2UgdGhhdCB0aGVyZSBpcyBrbXMgZGV2aWNlIHJlZ2lzdGVyZWQuCj4+Cj4g
SSBiZWxpZXZlIGl0J3MgcHJlZmVycmVkIHRvIGFkZCBjaGFuZ2Vsb2csIHRoZSBvcmlnaW5hbCBy
ZXBvcnRlciAoc28KPiB0aGF0IHRoZXkgY2FuIHRlc3QpIGFuZCB0aGUgYnVnIHJlcG9ydCBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UuIFNvbWV0aGluZwo+IGxpa2UgdGhlIGZvbGxvd2luZzoKPiAKPiB2
MjoKPiAgLSBVc2UgZHJtX2NvbXBvbmVudF9saXN0IHRoZSByYXRoZXIgdGhhbiBvZl9tYWNoaW5l
X2lzX2NvbXBhdGlibGUgdG8KPiBjaGVjayBmb3IgcHJlc2VuY2Ugb2YgYW4gRXh5bm9zIFNvQy4K
PiAKPiBDYzogTWF0d2V5IFYuIEtvcm5pbG92IDxtYXR3ZXkua29ybmlsb3ZAZ21haWwuY29tPgo+
IFJlZmVyZW5jZXM6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
ODc2OTEKPiAKSSdtIGEgZ2VuaXVzLiBQbGVhc2UgZGlzcmVnYXJkIHRoZSBhYm92ZS4KCi1FbWls
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
