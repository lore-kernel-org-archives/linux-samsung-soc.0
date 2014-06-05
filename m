From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] [RFC] ASoC: samsung: move s3c24xx over
	to dmaengine
Date: Thu, 05 Jun 2014 16:04:03 +0200
Message-ID: <4306380.m7SZhHfhaK@wuerfel>
References: <6123933.aGtaUr149J@wuerfel> <20140605133606.GX2520@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20140605133606.GX2520@sirena.org.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, lgirdwood@gmail.com, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday 05 June 2014 14:36:06 Mark Brown wrote:
> On Thu, Jun 05, 2014 at 03:20:50PM +0200, Arnd Bergmann wrote:
> > The s3c24xx sound support keeps giving randconfig build errors, this
> > is a new attempt to solve it by moving the driver over to use dmaengine
> > exclusively.
> 
> We already have a patch pending for this, it's just waiting until after
> the merge window to avoid bisection breakage since it depends on
> dmaengine changes.

Ok, very good.

	Arnd
