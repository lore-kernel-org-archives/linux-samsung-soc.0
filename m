From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v8 04/16] DMA: PL330: Remove the start operation for
	handling DMA_TERMINATE_ALL command
Date: Wed, 07 Sep 2011 16:23:01 +0900
Message-ID: <000c01cc6d2e$fa01d8d0$ee058a70$%kim@samsung.com>
References: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
	<1314924284-25554-5-git-send-email-boojin.kim@samsung.com>
	<CABb+yY1QN9CzT=CGJ1n-pk8_QyeEK1Sx=HT2n8SMB9O-XrsXDg@mail.gmail.com>
	<20110906122718.GP6619@n2100.arm.linux.org.uk>
	<CAJe_ZhfaYmgPFhU-KJ3Oj6jdPN0i584yzziSzQzd_6uNSXodHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <CAJe_ZhfaYmgPFhU-KJ3Oj6jdPN0i584yzziSzQzd_6uNSXodHQ@mail.gmail.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Jassi Brar' <jaswinder.singh@linaro.org>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Boojin Kim' <boojin.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Linus Walleij' <linus.walleij@linaro.org>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Jassi Brar wrote:
> 
> On 6 September 2011 17:57, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Tue, Sep 06, 2011 at 05:52:19PM +0530, Jassi Brar wrote:
> >> On Fri, Sep 2, 2011 at 6:14 AM, Boojin Kim <boojin.kim@samsung.com> wrote:
> >> > Origianl code carries out the start operation after flush operation.
> >> > But start operation is not required for DMA_TERMINATE_ALL command.
> >> > So, This patch removes the unnecessary start operation and only carries out
> >> > the flush oeration for handling DMA_TERMINATE_ALL command.
> >>
> >> Not exactly. The 'start' is impotent when called from this path because there
> >> is nothing left queued after the call to 'flush'.
> >> pl330_tasklet() is called because that is a common function that does the
> >> house-keeping acc to what's presently in 'work' and 'done' lists.
> >>
> >> Though as a side-effect, your patch does avoid doing callbacks on submitted
> >> xfers during DMA_TERMINATE_ALL - which may or may not be the right thing
> >> to do.
> >
> > It is defined that DMA_TERMINATE_ALL does not call the callbacks:
> >
> > 1. int dmaengine_terminate_all(struct dma_chan *chan)
> >
> >   This causes all activity for the DMA channel to be stopped, and may
> >   discard data in the DMA FIFO which hasn't been fully transferred.
> >   No callback functions will be called for any incomplete transfers.
> >
> Ok, thanks for the info.
> 
> Boojin Kim, please re-write the changelog to state only preventing
> callbacks during DMA_TERMINATE_ALL as the reason.

As above, we don't need callback as well start operation in DMA_TERMIANTE_ALL command and her patch just removed them for DMA_TERMINATE_ALL here. So current git message seems to have proper behavior of patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
