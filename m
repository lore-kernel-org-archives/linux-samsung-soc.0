From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] ARM: S5PV210: Add the GPIO lib
Date: Thu, 29 Jul 2010 10:40:39 -0700
Message-ID: <20100729174038.GF24781@opensource.wolfsonmicro.com>
References: <4C4F9E4D.4090608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <4C4F9E4D.4090608@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Ben Dooks <ben@simtec.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lrg@slimlogic.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 28, 2010 at 12:04:45PM +0900, Chanwoo Choi wrote:
> This patch add the definition of GPIO to support WM8994 audio codec on
> I2C bus.
> 
> Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>

This should come before the patch using it in your patch series, that
way things won't break when people do git bisect and try to build the
first patch without the second.  The changelog could also do with a bit
of a cleanup - this isn't something that's specific to a particular
board, it's adding support for the GPIOs for whatever function they are
needed on any board using this processor.
