From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 2/3] ARM: dts: exynos: DT for v4.9, second round
Date: Mon, 19 Sep 2016 17:46:21 +0200
Message-ID: <4051277.uyRH9KkCtQ@wuerfel>
References: <1474216788-17282-1-git-send-email-krzk@kernel.org> <1474216788-17282-3-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474216788-17282-3-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Sunday, September 18, 2016 6:39:47 PM CEST Krzysztof Kozlowski wrote:
> Samsung DeviceTree update for v4.9, second round:
> 1. Enable HDMI on Arndale Octa board.
> 2. Update list of clocks for FIMC-IS block on Exynos4x12.
> 3. Remove skeleton.dtsi thus fixing DT compiler warning:
>         "Node /memory has a reg or ranges property, but no unit name"
>    This is a tree-wide effort by various people. Javier Martinez Canillas did
>    it for Exynos and S5PV210.
> 

Pulled into next/dt, thanks!

	Arnd
