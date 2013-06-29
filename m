From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 1/5] phy: Add driver for Exynos MIPI CSIS/DSIM DPHYs
Date: Sat, 29 Jun 2013 14:27:59 +0530
Message-ID: <51CEA197.8070207@ti.com>
References: <1372258946-15607-1-git-send-email-s.nawrocki@samsung.com>
 <1372258946-15607-2-git-send-email-s.nawrocki@samsung.com>
 <51CD4698.3070409@gmail.com> <51CD6153.5050406@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51CD6153.5050406@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, jg1.han@samsung.com, dh09.lee@samsung.com, balbi@ti.com, inki.dae@samsung.com, kyungmin.park@samsung.com, Hui Wang <jason77.wang@gmail.com>, kgene.kim@samsung.com, plagnioj@jcrosoft.com, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Friday 28 June 2013 03:41 PM, Sylwester Nawrocki wrote:
> On 06/28/2013 10:17 AM, Hui Wang wrote:
>> On 06/26/2013 11:02 PM, Sylwester Nawrocki wrote:
>>> Add a PHY provider driver for the Samsung S5P/Exynos SoC MIPI CSI-2
>>> receiver and MIPI DSI transmitter DPHYs.
>>>
>>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>>> ---
>>> Changes since v2:
>>>    - adapted to the generic PHY API v9: use phy_set/get_drvdata(),
>>>    - fixed of_xlate callback to return ERR_PTR() instead of NULL,
>>>    - namespace cleanup, put "GPL v2" as MODULE_LICENSE, removed pr_debug,
>>>    - removed phy id check in __set_phy_state().
>>> ---
>> [...]
>>> +
>>> +	if (IS_EXYNOS_MIPI_DSIM_PHY_ID(id))
>>> +		reset = EXYNOS_MIPI_PHY_MRESETN;
>>> +	else
>>> +		reset = EXYNOS_MIPI_PHY_SRESETN;
>>> +
>>> +	spin_lock_irqsave(&state->slock, flags);
>>
>> Sorry for one stupid question here, why do you use spin_lock_irqsave()
>> rather than spin_lock(),
>> I don't see the irq handler will use this spinlock anywhere in this c file.
>
> Yes, there is no chance the PHY users could call the phy ops from within
> an interrupt context. Especially now when there is a per phy object
> mutex used in the PHY operation helpers. So I'll replace it with plain
> spin_lock/unlock. Thank you for the review.

Now that PHY ops is already protected, do you really need a spin_lock here?

Thanks
Kishon
