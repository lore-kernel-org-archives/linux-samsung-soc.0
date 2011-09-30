From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: [PATCH 2/2] ARM: Switch to using CLKDEV_INIT macro for creating
	clk_lookup instance
Date: Fri, 30 Sep 2011 12:08:58 -0500
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC56761@AUSP01VMBX24.collaborationhost.net>
References: <1317381097-2691-1-git-send-email-padma.v@samsung.com>
	<1317381097-2691-3-git-send-email-padma.v@samsung.com>
	<4E85B779.7030402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4E85B779.7030402@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryan Mallon <rmallon@gmail.com>, Padmavathi Venna <padma.v@samsung.com>
Cc: "khilman@ti.com" <khilman@ti.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "nsekhar@ti.com" <nsekhar@ti.com>, "amit.kucheria@canonical.com" <amit.kucheria@canonical.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "padma.kvr@gmail.com" <padma.kvr@gmail.com>, "hjk@hansjkoch.de" <hjk@hansjkoch.de>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday, September 30, 2011 5:35 AM, Ryan Mallon wrote:
> On 30/09/11 21:11, Padmavathi Venna wrote:
>> Replace platform specific macros that creates struct clk_lookup
>> instance with the new common CLKDEV_INIT macro
>>
>> Suggested by: Russell King <rmk+kernel@arm.linux.org.uk>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---

[...]

>>  static struct clk_lookup cdce_clks[] = {
>> -	CLK(NULL, "xin", &cdce_clk_in),
>> -	CLK(NULL, NULL, NULL),
>> +	CLKDEV_INIT(NULL, "xin", cdce_clk_in)
>> +	{.dev_id = NULL, .con_id = NULL, .clk = NULL,},
>
> Why not CLKDEV_INIT(NULL, NULL, NULL)? Or create another macro
> CLKDEV_NULL (or similar) for the last entry in the list rather than
> duplicating this everywhere.

The CLKDEV_INIT macro does this with the third parameter:

	.clk = &c,

I'm not sure &NULL is valid.

Is the sentinel entry actually needed?  ep93xx does not have one.

Regards,
Hartley
