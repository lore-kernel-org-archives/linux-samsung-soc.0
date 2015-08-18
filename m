From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] rtc: s3c: fix disabled clocks for alarm
Date: Tue, 18 Aug 2015 14:44:11 +0900
Message-ID: <55D2C62B.1010209@samsung.com>
References: <1439374906-27841-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <1439374906-27841-1-git-send-email-jy0922.shim@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, cw00.choi@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 12.08.2015 19:21, Joonyoung Shim wrote:
> The clock enable/disable codes for alarm have been removed from
> commit 24e1455493da ("drivers/rtc/rtc-s3c.c: delete duplicate clock
> control") and the clocks are disabled even if alarm is set, so alarm
> interrupt can't happen.
> 
> The s3c_rtc_setaie function can be called several times with 'enabled'
> argument having same value, so it needs to check whether clocks are
> enabled or not.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: <stable@vger.kernel.org> # v4.1
> ---
> This is v2 of prior patch "[PATCH 4/4] rtc: s3c: enable/disable clocks
> for alarm".
> 
> Changelog for v2:
> - commit messages is modified by Krzysztof suggestion
> - make to backportable patch
> - add Cc-stable
> 
>  drivers/rtc/rtc-s3c.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 

Looks good now:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
