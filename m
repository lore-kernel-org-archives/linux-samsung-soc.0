From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3] ARM: dts: fix the clock-frequency of rinato board's
 panel
Date: Mon, 15 Jun 2015 14:16:32 +0900
Message-ID: <557E5FB0.6040107@samsung.com>
References: <1434340997-25146-1-git-send-email-hyungwon.hwang7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <1434340997-25146-1-git-send-email-hyungwon.hwang7@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Hyungwon Hwang <hyungwon.hwang7@gmail.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, human.hwang@samsung.com
Cc: stable@vger.kernel.org, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 15.06.2015 13:03, Hyungwon Hwang wrote:
> From: Hyungwon Hwang <human.hwang@samsung.com>
> 
> After the commit abc0b1447d4974963548777a5ba4a4457c82c426
> ("drm: Perform basic sanity checks on probed modes"), proper
> clock-frequency becomes mandatory for validating the mode of panel.
> The display does not work if there is no mode validated. Also, this
> clock-frequency must be set appropriately for getting required frame
> rate.
> 
> Fixes: abc0b1447d49 ("drm: Perform basic sanity checks on probed modes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>

Thanks very much! Please CC always Kukjin Kim.

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
