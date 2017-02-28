From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RESEND PATCH v2 0/5] Fix the parse_dt of exynos dsi and remove
 the OF graph
Date: Tue, 28 Feb 2017 11:58:25 +0200
Message-ID: <CAJKOXPfv8wJ+0L4G_0sB1Qh-svXx4VvNJH_1THSy5SsXuUstzA@mail.gmail.com>
References: <CGME20170228081811epcas5p3c0a8151d94511e47a0e0d2b8787b1fb0@epcas5p3.samsung.com>
 <1488269879-28876-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488269879-28876-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, jy0922.shim@samsung.com, Seung Woo Kim <sw0312.kim@samsung.com>, airlied@linux.ie, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, Javier Martinez Canillas <javier@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 28, 2017 at 10:17 AM, Hoegeun Kwon <hoegeun.kwon@samsung.com> wrote:
> Hi All,
>
> [Resend this v2 patches, because i have missing TO and CC.]
>
> The dsi + panel is a parental relationship, so OF grpah is not needed.
> Therefore, the current dsi_parse_dt function will throw an error,
> because there is no linked OF graph for case such as fimd + dsi +
> panel.
>
> So the 1/5 patch parse the Pll, burst and esc clock frequency
> properties in dsi_parse_dt and modified to create a bridge_node only
> if there is an OF graph associated with dsi.
>
> Also fixed the dts, which depend on the 1/5 patch. So removed the
> ports node and move burst and esc clock frequency properties to the
> parent (DSI node).

Discussions in previous thread lead us to bisectability problem.
Bisectability in regular driver changes is one thing but in case of
driver + DTS the gap is much bigger. DTS will go through separate tree
and branches. How do you want to solve the problem?

Best regards,
Krzysztof
