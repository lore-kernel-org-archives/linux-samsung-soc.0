From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 10/17] drm/imx: removed optional dummy encoder
 mode_fixup function.
Date: Mon, 15 Feb 2016 17:16:55 +0100
Message-ID: <1455553015.4899.38.camel@pengutronix.de>
References: <cover.1455540137.git.palminha@synopsys.com>
 <8bf274e8f6908142a9f940d3f2913e4a735e0caa.1455540137.git.palminha@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <8bf274e8f6908142a9f940d3f2913e4a735e0caa.1455540137.git.palminha@synopsys.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, jingoohan1@gmail.com, virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org, kgene@kernel.org, dri-devel@lists.freedesktop.org, benjamin.gaignard@linaro.org, vincent.abriou@st.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

QW0gTW9udGFnLCBkZW4gMTUuMDIuMjAxNiwgMTM6MDAgKzAwMDAgc2NocmllYiBDYXJsb3MgUGFs
bWluaGE6Cj4gbW9kZV9maXh1cCBmdW5jdGlvbiBmb3IgZW5jb2RlciBkcml2ZXJzIGJlY2FtZSBv
cHRpb25hbCB3aXRoIHBhdGNoCj4gaHR0cDovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0
Y2gvbXNnaWQvMTQ1NTEwNjUyMi0zMjMwNy0xLWdpdC1zZW5kLWVtYWlsLXBhbG1pbmhhQHN5bm9w
c3lzLmNvbQo+IAo+IFRoaXMgcGF0Y2ggc2V0IG51a2VzIGFsbCB0aGUgZHVtbXkgbW9kZV9maXh1
cCBpbXBsZW1lbnRhdGlvbnMuCj4gCj4gKG1hZGUgb24gdG9wIG9mIERhbmllbCB0b3BpYy9kcm0t
bWlzYyBicmFuY2gpCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2FybG9zIFBhbG1pbmhhIDxwYWxtaW5o
YUBzeW5vcHN5cy5jb20+CgpBY2tlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRy
b25peC5kZT4KCnJlZ2FyZHMKUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
