From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fix build of I2S driver
Date: Fri, 30 Nov 2012 20:00:10 +0900
Message-ID: <1d7501cdcee9$ddefbb30$99cf3190$%kim@samsung.com>
References: <1353944420-3972-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <15c501cdcc36$db54cb00$91fe6100$%kim@samsung.com>
 <20121127064313.GV9411@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20121127064313.GV9411@opensource.wolfsonmicro.com>
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
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Padmavathi Venna' <padma.v@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> On Tue, Nov 27, 2012 at 09:33:43AM +0900, Kukjin Kim wrote:
> 
> > I checked Samsung audio driver stuff just now. If you don't mind, I will
> > drop the patch 48a2050d ("ARM: SAMSUNG: Delete the unnecessary
variable")
> > instead of applying this.
> 
> That works just as well for me, thanks.  Padma, as I said in the commit
> log this should be done as part of a single patch series rather than
> sending separately to ARM or ASoC so that both trees continue to build
> at each point.
> 
> > If any unprepared patches for Samsung audio in my tree, please let me
> know.
> 
> Will do.

Mark, I'm holding on Padma's changes for Samsung audio.

If any updates about this from your side?

Is it ok to send current next/audio-samsung in my tree to upstream for v3.8?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
