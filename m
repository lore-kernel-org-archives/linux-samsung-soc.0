From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCHv4 1/9] video: add hotplug detect notifier support
Date: Mon, 06 Feb 2017 14:08:09 +0100
Message-ID: <dff7e731-8e73-a4c6-c338-fa58bd4f4aa9@samsung.com>
References: <20170206102951.12623-1-hverkuil@xs4all.nl>
 <CGME20170206103035epcas1p27ddfca1de4b572a8565bb8b3b1b2de24@epcas1p2.samsung.com>
 <20170206102951.12623-2-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20170206102951.12623-2-hverkuil@xs4all.nl>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDYuMDIuMjAxNyAxMToyOSwgSGFucyBWZXJrdWlsIHdyb3RlOgo+IEZyb206IEhhbnMgVmVy
a3VpbCA8aGFucy52ZXJrdWlsQGNpc2NvLmNvbT4KPgo+IEFkZCBzdXBwb3J0IGZvciB2aWRlbyBo
b3RwbHVnIGRldGVjdCBhbmQgRURJRC9FTEQgbm90aWZpZXJzLCB3aGljaCBpcyB1c2VkCj4gdG8g
Y29udmV5IGluZm9ybWF0aW9uIGZyb20gdmlkZW8gZHJpdmVycyB0byB0aGVpciBDRUMgYW5kIGF1
ZGlvIGNvdW50ZXJwYXJ0cy4KPgo+IEJhc2VkIG9uIGFuIGVhcmxpZXIgdmVyc2lvbiBmcm9tIFJ1
c3NlbGwgS2luZzoKPgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTI3NzA0
My8KPgo+IFRoZSBocGRfbm90aWZpZXIgaXMgYSByZWZlcmVuY2UgY291bnRlZCBvYmplY3QgY29u
dGFpbmluZyB0aGUgSFBEL0VESUQvRUxEIHN0YXRlCj4gb2YgYSB2aWRlbyBkZXZpY2UuCj4KPiBX
aGVuIGEgbmV3IG5vdGlmaWVyIGlzIHJlZ2lzdGVyZWQgdGhlIGN1cnJlbnQgc3RhdGUgd2lsbCBi
ZSByZXBvcnRlZCB0bwo+IHRoYXQgbm90aWZpZXIgYXQgcmVnaXN0cmF0aW9uIHRpbWUuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGhhbnMudmVya3VpbEBjaXNjby5jb20+Cj4gVGVz
dGVkLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CgpGb3Ig
cGF0Y2hlcyAxLTY6ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcu
Y29tPgotLQpSZWdhcmRzCkFuZHJ6ZWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
