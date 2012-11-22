From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] i2c: s3c2410: Get the i2c bus number from alias id
Date: Thu, 22 Nov 2012 15:56:38 +0900
Message-ID: <0f5f01cdc87e$84cacc50$8e6064f0$%kim@samsung.com>
References: <1353450428-2615-1-git-send-email-dianders@chromium.org>
 <1353450428-2615-2-git-send-email-dianders@chromium.org>
 <20121121040913.GA13280@sirena.org.uk>
 <CAD=FV=V-59u-J40G3x9oK5phUX-5pa9xJLN9QnGJCRqGfc_2ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <CAD=FV=V-59u-J40G3x9oK5phUX-5pa9xJLN9QnGJCRqGfc_2ow@mail.gmail.com>
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
To: 'Doug Anderson' <dianders@chromium.org>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Padmavathi Venna' <padma.v@samsung.com>, 'Wolfram Sang' <w.sang@pengutronix.de>, linux-kernel@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-i2c@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Doug Anderson wrote:
> 
> On Tue, Nov 20, 2012 at 8:09 PM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
> > On Tue, Nov 20, 2012 at 02:27:04PM -0800, Doug Anderson wrote:
> >> From: Padmavathi Venna <padma.v@samsung.com>
> >>
> >> Get the i2c bus number that the device is connected to using the alias
> >> id.  This makes debugging / grokking of kernel messages much easier.
> >
> > This doesn't look like a s3c2410 specific change - it's a generic device
> > tree issue.  This suggests that it sohuld be implemented in the
> > framework so that all I2C controllers with DT can use it.
> 
> Good suggestion.  I have posted a series with the title "Add automatic
> bus number support for i2c busses with device tree".  It contains the
> i2c-core patch as well as a patch removing similar code from the pxa
> i2c driver.
> 
> Kukjin: please consider this patch abandoned and superseded by the new
> i2c-core patch.  As Olof said, the patch for adding aliases for
> exynos4 should still be fine to apply.
> 
OK, I see.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
