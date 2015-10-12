From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2] arm: dts: Fix audio card detection on peach boards
Date: Tue, 13 Oct 2015 04:10:01 +0900
Message-ID: <561C0589.7010103@kernel.org>
References: <1444653438-6532-1-git-send-email-alim.akhtar@samsung.com> <561BAFE0.5070205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48326 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751892AbbJLTKH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Oct 2015 15:10:07 -0400
In-Reply-To: <561BAFE0.5070205@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, k.kozlowski.k@gmail.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org, devicetree@vger.kernel.org, dianders@chromium.org, stable@vger.kernel.org

On 10/12/15 22:04, Krzysztof Kozlowski wrote:
> W dniu 12.10.2015 o 21:37, Alim Akhtar pisze:
>> Since commit 2fad972d45c4 ("ARM: dts: Add mclk entry for Peach boards"),
>> sound card detection is broken on peach boards and gives below errors:
>>
>> [    3.630457] max98090 7-0010: MAX98091 REVID=0x51
>> [    3.634233] max98090 7-0010: use default 2.8v micbias
>> [    3.640985] snow-audio sound: HiFi <-> 3830000.i2s mapping ok
>> [    3.645307] max98090 7-0010: Invalid master clock frequency
>> [    3.650824] snow-audio sound: ASoC: Peach-Pi-I2S-MAX98091 late_probe() failed: -22
>> [    3.658914] snow-audio sound: snd_soc_register_card failed (-22)
>> [    3.664366] snow-audio: probe of sound failed with error -22
>>
>> This patch adds missing assigned-clocks and assigned-clock-parents for
>> pmu_system_controller node which is used as "mclk" for audio codec.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Fixes: 2fad972d45c4 ("ARM: dts: Add mclk entry for Peach boards")
>> Cc: <stable@vger.kernel.org>
>> ---
>> Changes since v1:
>> Addressed Krzysztof's review comments.
> 
> Looks good, thanks!
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
Applied, thanks.

- Kukjin
