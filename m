From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v3 7/9] drm/bridge: tc358764: Add DSI to LVDS bridge driver
Date: Tue, 19 Jun 2018 19:05:06 +0800
Message-ID: <201806191813.jof7uloL%fengguang.wu@intel.com>
References: <1529396370-18761-8-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1529396370-18761-8-git-send-email-m.purski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Maciej Purski <m.purski@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, kbuild-all@01.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgQW5kcnplaiwKCkkgbG92ZSB5b3VyIHBhdGNoISBQZXJoYXBzIHNvbWV0aGluZyB0byBpbXBy
b3ZlOgoKW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHY0LjE4LXJjMV0KW2Fsc28gYnVpbGQg
dGVzdCBXQVJOSU5HIG9uIG5leHQtMjAxODA2MTldCltjYW5ub3QgYXBwbHkgdG8gZHJtLWV4eW5v
cy9leHlub3MtZHJtL2Zvci1uZXh0IHJvYmgvZm9yLW5leHQgZHJtL2RybS1uZXh0XQpbaWYgeW91
ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwgcGxlYXNlIGRyb3AgdXMg
YSBub3RlIHRvIGhlbHAgaW1wcm92ZSB0aGUgc3lzdGVtXQoKdXJsOiAgICBodHRwczovL2dpdGh1
Yi5jb20vMGRheS1jaS9saW51eC9jb21taXRzL01hY2llai1QdXJza2kvZHJtLWV4eW5vcy1yZW5h
bWUtYnJpZGdlX25vZGUtdG8tbWljX2JyaWRnZV9ub2RlLzIwMTgwNjE5LTE3NTEzNgoKCmNvY2Np
bmVsbGUgd2FybmluZ3M6IChuZXcgb25lcyBwcmVmaXhlZCBieSA+PikKCj4+IGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjQuYzoxNzk6NjAtNjY6IEVSUk9SOiBhcHBsaWNhdGlvbiBvZiBz
aXplb2YgdG8gcG9pbnRlcgoKUGxlYXNlIHJldmlldyBhbmQgcG9zc2libHkgZm9sZCB0aGUgZm9s
bG93dXAgcGF0Y2guCgotLS0KMC1EQVkga2VybmVsIHRlc3QgaW5mcmFzdHJ1Y3R1cmUgICAgICAg
ICAgICAgICAgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIKaHR0cHM6Ly9saXN0cy4wMS5v
cmcvcGlwZXJtYWlsL2tidWlsZC1hbGwgICAgICAgICAgICAgICAgICAgSW50ZWwgQ29ycG9yYXRp
b24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
