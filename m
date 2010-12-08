From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 3/3] ARM: S3C64XX: Use chip_data to store the shift for
	EINTs
Date: Wed, 08 Dec 2010 00:36:01 +0000
Message-ID: <4CFED2F1.3010902@fluff.org>
References: <1290698309-7691-1-git-send-email-broonie@opensource.wolfsonmicro.com>	<1290698309-7691-3-git-send-email-broonie@opensource.wolfsonmicro.com>	<003101cb914d$1caf7040$560e50c0$%kim@samsung.com>
	<20101201115535.GK24176@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20101201115535.GK24176@rakim.wolfsonmicro.main>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On 01/12/10 11:55, Mark Brown wrote:
> On Wed, Dec 01, 2010 at 08:44:25PM +0900, Kukjin Kim wrote:
>> Mark Brown wrote:
> 
>>> This makes all the functions that use the shift slightly smaller, one
>>> instruction in most cases but more for ack() and maskack().
> 
>> Uhm...I'm not sure to use chip_data for the eint_irq_to_bit() is best to us.
> 
> Could you elaborate on your concern here?  I can't think of anything
> else we might want to include in the data, and avoiding the shifts
> and/or dereferences seems useful for anyone doing interrupt heavy work.

Hi, post code to show difference in output would be good!
