From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCHv2 05/10] ASoC: AC97: SMDK: Add
	wm9713	machine driver
Date: Thu, 28 Jan 2010 12:00:26 +0000
Message-ID: <20100128120020.GA19270@sirena.org.uk>
References: <1264571959-15115-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <1264571959-15115-1-git-send-email-jassisinghbrar@gmail.com>
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

On Wed, Jan 27, 2010 at 02:59:19PM +0900, jassisinghbrar@gmail.com wrote:

> +	Headphone Playback Switch - On
> +	$ amixer cset numid=4 1
> +

Actually, one thing that really needs fixing here - these instructions
refer to the controls by number.  This is extremely fragile in the face
of any changes in the CODEC driver since the control numbering is worked
out at runtime and any change in the set of controls exported by the
device may change the result.  It is much better to refer to the
controls by name since the names are much less likely to change.  This
is also helpful for people using other UIs which don't display the
control names.
