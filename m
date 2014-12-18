From: nick <xerofoify@gmail.com>
Subject: Re: Weird/Unneeded call to msleep in exynos_mipi_dsi_wr_data in
 exynos_mipi_dsi_common.c
Date: Thu, 18 Dec 2014 08:35:10 -0500
Message-ID: <5492D80E.3010906@gmail.com>
References: <54920A54.2060608@gmail.com> <5492ABE7.1060900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5492ABE7.1060900@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski@samsung.com>, inki.dae@samsung.com
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dh09.lee@samsung.com, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, tomi.valkeinen@ti.com, kgene@kernel.org, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

S3J6eXN6dG9mLApJZiB3ZSBsb29rIGF0IHRoZSBjb2RlIGZvciB0aGlzIGZ1bmN0aW9uLCBpdCBh
bHJlYWR5IGlzIGhhbmRsaW5nIHRoZSBkYXRhIGNvcnJlY3RseS4gSW4gYWRkaXRpb24gIHRoZSBs
b2NrcyAKc2VlbSB0byBiZSBiZXR0ZXIgcHJvdGVjdGlvbiB0aGVuIG1zbGVlcC4gRnVydGhlciBt
b3JlIGlzIG5vIHJlYXNvbiBmb3IgdGhpcyBkZWxheSBhcyB3ZSBhcmUgbmVpdGhlciByZXNldHRp
bmcgCnRoZSBoYXJkd2FyZSBvciB3YWl0aW5nIGZvciB0aGUgaGFyZHdhcmUgaGVyZSBzbyB3aHkg
aXMgaXQgbmVlZGVkPyBJIGRvbid0IGhhdmUgRXh5bm9zIGJhc2VkIGhhcmR3YXJlIGx5aW5nCmFy
b3VuZCB0aHJvdWdoIHRvIHRlc3QgaXQuCk5pY2sKT24gMjAxNC0xMi0xOCAwNToyNiBBTSwgS3J6
eXN6dG9mIEtvesWCb3dza2kgd3JvdGU6Cj4gT24gMTcuMTIuMjAxNCAyMzo1NywgbmljayB3cm90
ZToKPj4gR3JlZXRpbmdzIEZlbGxvdyBNYWludGFpbmVycywKPj4gU29ycnkgaWYgSSB3YXN0aW5n
IHlvdXIgdGltZSBidXQgaXQgc2VlbXMgdGhlcmUgaXMgYSB1bm5lZWRlZCBjYWxsIHRvIG1zbGVl
cAo+IAo+IEhpLAo+IAo+IDEuIFBsZWFzZSBkZXNjcmliZSBleGFjdGx5IHdoeSBkbyB5b3UgdGhp
bmsgdGhpcyBpcyBub3QgbmVlZGVkLgo+IDIuIERvIHlvdSBoYXZlIEV4eW5vcy1iYXNlZCBoYXJk
d2FyZSB0byB0ZXN0IHlvdXIgY2hhbmdlcz8KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9m
Cj4gCj4+IGFuZCByYXRoZXIgdHJpdmlhbCBmaXggbWUgdG8gZml4IGluIHRoZSBmaWxlLGV4eW5v
c19taXBpX2RzaV9jb21tb24uYyBmb3IgdGhlIGZ1bmN0aW9uLGV4eW5vc19taXBpX2RzaV93cl9k
YXRhIC4gSWYgdGhlcmUgaXMgYSB2YWxpZCByZWFzb24gZm9yIHRoaXMgY2FsbCBwbGVhc2UgbGV0
IG1lIGtub3duIHdoZW4gYW55IG9mIHlvdSAgaGF2ZSBzb21lIGZyZWUgdGltZS4gT3RoZXJ3aXNl
IEkgd2lsbCBzZW5kIGluIGEgcGF0Y2ggdG8gcmVtb3ZlIHRoaXMgdW5uZWVkZWQKPj4gY2FsbCB0
byBtc2xlZXAuCj4+IFRoYW5rcywKPj4gTmljayAgCj4gCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
