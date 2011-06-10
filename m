From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/4] ASoC: SAMSUNG: Change platform driver
 for SMDKs
Date: Fri, 10 Jun 2011 11:16:38 +0100
Message-ID: <20110610101638.GF26436@opensource.wolfsonmicro.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
	<1307606950-8310-4-git-send-email-sbkim73@samsung.com>
	<BANLkTinUk6CRdh8mYAk7fbd9Ga6iBRfcaA@mail.gmail.com>
	<000a01cc273e$49dc4610$dd94d230$@com>
	<BANLkTikswO-5LOreJq=OXutya_CzYUkh1g@mail.gmail.com>
	<20110610094920.GC26436@opensource.wolfsonmicro.com>
	<BANLkTinCKbPC0gTO5FJXn96wLMEUdZ+R3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <BANLkTinCKbPC0gTO5FJXn96wLMEUdZ+R3Q@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 10, 2011 at 03:42:27PM +0530, Jassi Brar wrote:
> On Fri, Jun 10, 2011 at 3:19 PM, Mark Brown

> > If iDMA is always a better choice on CPUs that support it then the
> > cpu_is_() macros might be a good way to make the selection?

> Actually I remembered just after I posted - iDMA wouldn't support capture.
> So iDMA is a bad choice after all.

So I guess the relevant boards would be better off adding a separate DAI
to allow applications to select the DAI they want at runtime?
