From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC 1/2] ARM: dts: exynos: update the usbdrd phy and ref clk
Date: Fri, 6 Oct 2017 08:38:52 +0200
Message-ID: <CAJKOXPe=hd7QdsaqpqPv3cNvL59FBqCfy24mYmGdQvi7Yp8wBQ@mail.gmail.com>
References: <1507264595-3565-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507264595-3565-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Oct 6, 2017 at 6:36 AM, Anand Moon <linux.amoon@gmail.com> wrote:
> update the usbdrd link control and phy contol clks.

The commit title and especially commit message should explain why you
are doing this and what are you doing. "Update" is not enough.
Everything could be called update.

Therefore I do not understand the reason behind the patch.

BR,
Krzysztof
