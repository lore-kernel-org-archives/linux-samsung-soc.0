From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V2 01/10] clk/exynos5410: move suspend/resume handling to
 SoC driver
Date: Thu, 23 Jan 2014 19:19:11 +0100
Message-ID: <52E15D1F.8090802@samsung.com>
References: <1389099548-14649-1-git-send-email-rahul.sharma@samsung.com>
 <1389099548-14649-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1389099548-14649-2-git-send-email-rahul.sharma@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, joshi@samsung.com, tomasz.figa@gmail.com, thomas.ab@samsung.com, r.sh.open@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07.01.2014 13:58, Rahul Sharma wrote:
> Suspend/resume handling is already moved for all other Exynos
> SoCs other than Exynos5420 which is addressed in this patch.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos5410.c |   49 ++++++++++++++++++++++++++++++----
>   1 file changed, 44 insertions(+), 5 deletions(-)

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
