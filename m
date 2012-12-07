From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH RESEND V2 1/2] ASoC: Samsung: Do not
 register samsung audio dma device as pdev
Date: Fri, 7 Dec 2012 19:37:46 +0900
Message-ID: <20121207103745.GK26070@opensource.wolfsonmicro.com>
References: <1354868962-7862-1-git-send-email-padma.v@samsung.com>
 <1354868962-7862-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1354868962-7862-2-git-send-email-padma.v@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, philipp.zabel@gmail.com, sbkim73@samsung.com, devicetree-discuss@lists.ozlabs.org, jassisinghbrar@gmail.com, mcuelenaere@gmail.com, anarsoul@gmail.com, tiwai@suse.de, kgene.kim@samsung.com, ben-linux@fluff.org, padma.kvr@gmail.com, dgreenday@gmail.com, chripell@evolware.org, graeme.gregory@wolfsonmicro.com, lrg@ti.com, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 07, 2012 at 01:59:21PM +0530, Padmavathi Venna wrote:
> Previously, the ASoC 'platform' (PCM/DMA) object was instantiated via a
> platform_device. This didn't represent the hardware well, since there
> was no separate hardware associated with this platform_device; it was a
> virtual device with sole purpose to call snd_soc_register_platform().

Applied, thanks.
