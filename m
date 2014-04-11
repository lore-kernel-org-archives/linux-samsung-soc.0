From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 12/27] ARM: dts: exynos3250: Add default interrupt-parent
 connected with GIC
Date: Fri, 11 Apr 2014 13:44:55 +0900
Message-ID: <53477347.1080603@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
 <1397124377-16969-4-git-send-email-cw00.choi@samsung.com>
 <20140411040050.GD14934@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20140411040050.GD14934@quad.lixom.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 04/11/2014 01:00 PM, Olof Johansson wrote:
> On Thu, Apr 10, 2014 at 07:06:02PM +0900, Chanwoo Choi wrote:
>> This patch add interrupt-parent node to connected with GIC.
>> All interrupt-related dt nodes need default interrupt-parent node.
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> There's no point in splitting these off in separate patches; fold them
> into one patch that introduces the SoC dtsi, please.

OK, I will consolidate following two patches into one patch.

[PATCH 11/27] ARM: dts: exynos3250: Add GIC dt node for Exynos3250
[PATCH 12/27] ARM: dts: exynos3250: Add default interrupt-parent connected with GIC

> 
> Also, you missed your sign-off on one or two of the previous ones, but that
> won't be a problem once they're folded in. :)

I'll add my sign-off to all the patches on next posting(v2).

> 
> Finally, if the code is yours, and you're posting it, then Kyungmin should
> probably have a Reviewed-by or Acked-by tag, not a Signed-off-by. See
> Documentation/SubmittingPatches, section 12 and 13.
> 

OK, I'll change from 'Signed-off-by' to 'Acked-by'.

Thanks,

Best Regards,
Chanwoo Choi
