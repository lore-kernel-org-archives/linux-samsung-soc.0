From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] arm64: defconfig: Enable s2mps11 regulator clk and s3c
 rtc driver
Date: Tue, 5 Jul 2016 10:01:27 -0400
Message-ID: <20dda870-4196-6160-59cf-ea6f9a5016c8@osg.samsung.com>
References: <1467713211-16014-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467713211-16014-1-git-send-email-alim.akhtar@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, pankaj.dubey@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hello Alim,

On 07/05/2016 06:06 AM, Alim Akhtar wrote:
> The s3c rtc controller on exynos7 platform uses rtc source clock
> from s2mps11 pmic. This patch enables the required bits to make
> rtc work on exynos7-espresso board.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
