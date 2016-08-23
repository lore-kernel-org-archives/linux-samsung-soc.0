From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/4] ARM: dts: exynos: Enable HDMI in Arndale Octa board
Date: Tue, 23 Aug 2016 21:55:51 +0200
Message-ID: <CAJKOXPew=cTK6RkiT+OoPbUcU2SBHdOYTSPG-av3FiN2HYNV=g@mail.gmail.com>
References: <1471943619-6102-1-git-send-email-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1471943619-6102-1-git-send-email-woogyom.kim@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Milo Kim <woogyom.kim@gmail.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 23, 2016 at 11:13 AM, Milo Kim <woogyom.kim@gmail.com> wrote:
> This patch-set enables HDMI in Arndale Octa board and fixes HPD DT property.
> It also includes code refactoring on ddc and phy.
>
> Milo Kim (4):
>   ARM: dts: exynos: Enable HDMI for Arndale Octa board
>   ARM: dts: exynos: Use 'hpd-gpios' instead of 'hpd-gpio'
>   gpu: drm: exynos_hdmi: Use consolidated function on binding DDC DT
>     property
>   gpu: drm: exynos_hdmi: Use consolidated function on binding PHY DT
>     property

I saw DTS patches on linux-samsung-soc patchwork but still I would
appreciate if you send them to appropriate maintainers pointed by
get_maintainers.pl script. DTS stuff goes through samsung-soc tree.

Best regards,
Krzysztof
