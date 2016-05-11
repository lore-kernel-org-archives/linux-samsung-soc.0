From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/4] drm/exynos: use generic code for managing zpos plane
 property
Date: Wed, 11 May 2016 14:16:34 +0200
Message-ID: <573322A2.5050603@samsung.com>
References: <1462962308-13410-1-git-send-email-benjamin.gaignard@linaro.org>
 <1462962308-13410-3-git-send-email-benjamin.gaignard@linaro.org>
 <57331D7F.5080000@samsung.com>
 <CA+M3ks7JptQqptmZNn7Xd74_=Rt2wUVauewkpez71tBFnKSEWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CA+M3ks7JptQqptmZNn7Xd74_=Rt2wUVauewkpez71tBFnKSEWQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMDUvMTEvMjAxNiAwMjowOSBQTSwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6Cj4gSSBoYXZl
bid0IGRvdWJsZSBjaGVjayBidXQgSSBoYWQgdG8gZG8gY2hhbmdlcyBpbnRvIHRoZSBvcmlnaW5h
bCBwYXRjaAo+IHNvIEkgZ3Vlc3MgdGhhdCAiZnJvbSIgZmllbGQgY29tZXMgdGhlIG5ldyBjb21t
aXQuCj4gCj4gSSB3aWxsIG1hbnVhbGx5IGVkaXQgdGhlIGNvbW1pdCBmb3IgdjIsCgpHaXQga2Vl
cHMgb3JpZ2luYWwgYXV0aG9yIHVudG91Y2hlZC4gWW91IGhhdmUgdG8gbWFudWFsbHkgY2hhbmdl
IHRoZQphdXRob3IgdG8gcmVtb3ZlIHRoZSBvcmlnaW5hbCBvbmUgKG9yIHVzZSBub24tc3RhbmRh
cmQgd2F5IG9mIGFwcGx5aW5nCnBhdGNoZXMpLiBJZiB5b3UgdXNlIEdpdCwganVzdCBzdGljayB0
byB0eXBpY2FsIHdvcmtmbG93IC0gZ2l0IGFtLCBnaXQKY29tbWl0IC0tYW1lbmQgLS1zaWdub2Zm
LCBnaXQgZm9ybWF0LXBhdGNoLCBldGMuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
