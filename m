From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 2/2] ARM: dts: Add rtc_src clk for s3c-rtc on
 exynos5250-snow
Date: Thu, 18 Sep 2014 08:48:49 +0200
Message-ID: <541A8051.20207@collabora.co.uk>
References: <1410954633-27025-1-git-send-email-javier.martinez@collabora.co.uk>	<1410954633-27025-3-git-send-email-javier.martinez@collabora.co.uk>
 <CAD=FV=W7xJ01m2oLtuDnogOmrpwpztbir=59oSWU6oojFYUWKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAD=FV=W7xJ01m2oLtuDnogOmrpwpztbir=59oSWU6oojFYUWKw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Drake <drake@endlessm.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Doug, Andreas,

On 09/17/2014 05:47 PM, Doug Anderson wrote:
>>
>>         rtc@101E0000 {
>>                 status = "okay";
>> +               clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
>> +               clock-names = "rtc", "rtc_src";
> 
> Wait, seriously?  Snow is still using the "rtc@101E0000" syntax?
> Whatever happened to the series that Andreas worked so hard on,
> including <https://patchwork.kernel.org/patch/4664801/>?
>

Andreas, I completely forgot about your series when writing this patch even
though I've on my TO-DO to sync the downstream and upstream Snow DTS once your
patches land. Sorry about that.

> 
> In any case, there's nothing wrong with Javier's patch other than the
> fact that it will eventually need to get merged with Andreas's, so:
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> 

Thanks, I'll re-spin and post again once Kukjin merges Andreas series.

Best regards,
Javier
