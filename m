From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 2/6] ASoC: samsung: Add DT bindings documentation for
 LPASS
Date: Thu, 16 Jun 2016 18:13:14 +0200
Message-ID: <5762D01A.2050802@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-3-git-send-email-s.nawrocki@samsung.com>
 <20160614232856.GA3240@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:18543 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752437AbcFPQNn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 12:13:43 -0400
In-reply-to: <20160614232856.GA3240@rob-hp-laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, ideal.song@samsung.com, beomho.seo@samsung.com, inki.dae@samsung.com, k.kozlowski@samsung.com, b.zolnierkie@samsung.com

On 06/15/2016 01:28 AM, Rob Herring wrote:
> On Mon, Jun 13, 2016 at 12:52:36PM +0200, Sylwester Nawrocki wrote:
>> > This patch add documentation of the DT bindings for the Samsung
>> > Exynos SoC Low Power Audio Subsystem.
>> > 
>> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> > ---
>> >  .../devicetree/bindings/sound/samsung,exynos5433-lpass.txt        | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/sound/samsung,exynos5433-lpass.txt
> Seems kind of incomplete, but for what's here:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, it's indeed a bit incomplete. Most of the functionality is
already covered by existing bindings of sub-IPs like I2S, DMAC, UART.
I'd expect more detailed binding be specified for newer SoCs and that
would be a different compatible string.
