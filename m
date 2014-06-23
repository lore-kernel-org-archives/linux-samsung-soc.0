From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [RESEND PATCH v2 1/2] ASoC: samsung: s3c24{xx,
 12}-i2s: port to use generic dmaengine API
Date: Mon, 23 Jun 2014 11:28:14 +0300
Message-ID: <CA+E=qVde5p_AWs2482D2kYtE0QxLxiiVaAQZmbtXvyDgWUJAEg@mail.gmail.com>
References: <1401642958-6236-1-git-send-email-anarsoul@gmail.com>
 <20140622105340.GN24291@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20140622105340.GN24291@sirena.org.uk>
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
Cc: alsa-devel@alsa-project.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
List-Id: linux-samsung-soc@vger.kernel.org

On Sun, Jun 22, 2014 at 1:53 PM, Mark Brown <broonie@kernel.org> wrote:
>
> On Sun, Jun 01, 2014 at 08:15:57PM +0300, Vasily Khoruzhick wrote:
> > Use dmaengine instead of legacy s3c24xx DMA API for s3c24xx and s3c2412
>

Hi Mark,

> These fail to apply against current code, can you please check and
> resend?


Sure, will resend tonight.

Regards
Vasily
