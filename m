From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [Rev2]Samsung: New driver for AC97 controllers
Date: Wed, 27 Jan 2010 20:45:10 +0000
Message-ID: <20100127204510.GB11601@rakim.wolfsonmicro.main>
References: <1264571815-14893-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1264571815-14893-1-git-send-email-jassisinghbrar@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: jassisinghbrar@gmail.com
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 27, 2010 at 02:56:55PM +0900, jassisinghbrar@gmail.com wrote:

>  A machine driver, for SMDKs with wm9713 as AC97 codec attached, has also
> been added. The driver is generic enough to be used as such with newer SoCs.

OK, works for me with a smoke test so I've applied all the sound/soc
parts.  I'll add a commit detailing the CFG jumper settings expected to
make it work out of the box on SMDK6410 since that catches quite a few
people out.
