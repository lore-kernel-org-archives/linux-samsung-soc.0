From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/4] ASoC: SAMSUNG: Change platform driver
	for SMDKs
Date: Thu, 9 Jun 2011 11:46:48 +0100
Message-ID: <20110609104648.GB12865@opensource.wolfsonmicro.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
	<1307606950-8310-4-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1307606950-8310-4-git-send-email-sbkim73@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jun 09, 2011 at 05:09:09PM +0900, Sangbeom Kim wrote:
> Change platform driver to support internal dma
> for smdk_wm8994 and smdk_wm8580

When you resubmit for the API change update it'd be helpful to update
the changelog to explain why the platforms are being changed to use only
internal DMA - what is the advantage this offers over regular DMA?  This
will help users understand how they should configure their own systems.
