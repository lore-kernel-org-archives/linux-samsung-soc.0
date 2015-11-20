From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: only run atomic_check() if crtc is active
Date: Fri, 20 Nov 2015 10:15:10 +0100
Message-ID: <564EE49E.1030308@samsung.com>
References: <1447333880-16555-1-git-send-email-gustavo@padovan.org>
 <20151112134929.GC645@ulmo> <20151117100611.GO16848@phenom.ffwll.local>
 <564B3777.1020804@samsung.com> <20151117161239.GI16848@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20151117161239.GI16848@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, "Szyprowski,
 Marek" <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMTEvMTcvMjAxNSAwNToxMiBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKCiguLi4pCj4gCj4g
Q2hlY2sgY3J0Y19zdGF0ZS0+ZW5hYmxlLCBza2lwIGlmIGZhbHNlLiBUaGF0J3MgdGhlICJpcyB0
aGlzIHBpcGVsaW5lCj4gY29uZmlndXJlZCIga25vYi4gRm9yIHBsYW5lL2Nvbm5lY3RvciBpdCdz
IHN0YXRlLT5jcnRjLCBidXQgd2l0aCB0aGUgc2FtZQo+IHJvbGUuCj4gCj4gSSBndWVzcyB3ZSBj
b3VsZCBjaGVjayB0aGF0IGluIHRoZSBoZWxwZXJzLCBidXQgd2UgbmVlZCB0byBiZSBjYXJlZnVs
IHRvCj4gc3RpbGwgY2FsbCAtPmF0b21pY19jaGVjayBmb3IgdGhlIGRpc2FibGluZyB0cmFuc2l0
aW9uLCBpbiBjYXNlIHVzZXJzcGFjZQo+IGlzIGFza2luZyBmb3IgYSB2Ymxhbmstc3luY2VkIGZs
aXAgdGhhdCBkaXNhYmxlcyBhIHBsYW5lIGJ1dCBzb21laG93Cj4gdGhhdCdzIG5vdCBwb3NzaWJs
ZS4gSSBzb21ld2hhdCBwcmVmZXIgdG8gaGFuZGxlIHRoYXQgYWxsIGluIGRyaXZlcnMKPiB0aG91
Z2guCj4gLURhbmllbAo+IAoKVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24sIEd1c3Rhdm8gd2ls
bCB5b3UgdXBkYXRlIHlvdXIgcGF0Y2g/CgpSZWdhcmRzCkFuZHJ6ZWoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
