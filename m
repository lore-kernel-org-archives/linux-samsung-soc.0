From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 3/8] drm/exynos: remove struct *_win_data abstraction on
 planes
Date: Wed, 1 Apr 2015 13:03:10 -0300
Message-ID: <20150401160310.GG7013@joana>
References: <1427816827-14867-1-git-send-email-gustavo@padovan.org>
 <1427816827-14867-4-git-send-email-gustavo@padovan.org>
 <trinity-d2f9c441-f8d4-40a4-b51b-c450e5d9aff5-1427817193699@3capp-gmx-bs24>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <trinity-d2f9c441-f8d4-40a4-b51b-c450e5d9aff5-1427817193699@3capp-gmx-bs24>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <Liquid.Acid@gmx.net>
Cc: linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgVG9iaWFzLAoKMjAxNS0wMy0zMSBUb2JpYXMgSmFrb2JpIDxMaXF1aWQuQWNpZEBnbXgubmV0
PjoKCj4gSGVsbG8sCj4gCj4gSSBqdXN0IHdhbnRlZCB0byBwb2ludCBvdXQgdGhhdCB0aGlzIGRv
ZXNuJ3QgYXBwbHkgdG8gZXh5bm9zLWRybS1maXhlcywgd2hpY2ggd2FzIHByb2JhYmx5IGNhdXNl
ZCBieSBEYW5pZWwncyBwaXRjaCBwYXRjaCBoZXJlOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
Y2dpdC9saW51eC9rZXJuZWwvZ2l0L2RhZWlua2kvZHJtLWV4eW5vcy5naXQvY29tbWl0Lz9oPWV4
eW5vcy1kcm0tZml4ZXMmaWQ9NTdhYWFmMzczZWRlOTVlYmFhZjkwNjk1MDcxZjdiMWY0YTk3Nzk1
ZgoKUmlnaHQuIEkndmUganVzdCBzZW50IGEgbmV3IHZlcnNpb24gb2YgdGhpcyBwYXRjaGVzIHJl
YmFzZWQgb24gdG9wIG9mIERhbmllbCdzCnBhdGNoLgoKCUd1c3Rhdm8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
