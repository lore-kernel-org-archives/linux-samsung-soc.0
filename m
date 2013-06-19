From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 11/11] ARM: s3c64xx: Add support for
 DMA using generic amba-pl08x driver
Date: Wed, 19 Jun 2013 21:50:35 +0200
Message-ID: <CACRpkdYqNgLZhJ3oPZcCPjWExjWC+1WzPY2kka4uKCKkLwuu_g@mail.gmail.com>
References: <1371416058-22047-1-git-send-email-tomasz.figa@gmail.com>
 <1371416058-22047-12-git-send-email-tomasz.figa@gmail.com>
 <CACRpkdbQ7+FDJh235vERbCcQcnW1Mzar9r5jgLaXAT5n6CiCFQ@mail.gmail.com>
 <91444857.CpeBVZzDHZ@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <91444857.CpeBVZzDHZ@flatron>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Padmavathi Venna <padma.v@samsung.com>, Takashi Iwai <tiwai@suse.de>, Alessandro Rubini <rubini@gnudd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Giancarlo Asnaghi <giancarlo.asnaghi@st.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Thomas Abraham <thomas.abraham@linaro.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 19, 2013 at 8:23 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Monday 17 of June 2013 16:04:47 Linus Walleij wrote:
>> On Sun, Jun 16, 2013 at 10:54 PM, Tomasz Figa <tomasz.figa@gmail.com>
> wrote:
>> > +static AMBA_AHB_DEVICE(s3c64xx_dma1, "dma-pl080s.1", 0x0a141080,
>> > +                       0x75100000, {IRQ_DMA1},
>> > &s3c64xx_dma1_plat_data);
>> Ah, does this mean the device does not have any AMBA PrimeCell ID
>> contents?
>
> Hmm, not really. The ID here is what I copied from PrimeCell ID registers
> and the method of registration is taken from S5PV210. If I remove the
> override, it will read the same value from registers.

OK then don't override. Overriding is for hardware which is all zeroes
in these registers.

>> Then use the ID 0x00053080 instead of 0x0a141080
>>
>> 0x53 is "S" for Samsung. Variant 0.
>
> Well, that's kind of solution to make sure that it won't conflict with any
> future variant manufactured by ARM, I guess.

Yeah, but as stated, if the hardware has proper IDs (these are
probably inspired by the PCI vendor/device/revision fields)
then rely on those.

Yours,
Linus Walleij
