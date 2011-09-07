From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH 2/5] ARM: SAMSUNG: Make the sleep code common for S3C64XX
	and newer SoCs
Date: Wed, 7 Sep 2011 17:00:03 +0530
Message-ID: <CAM4voak8Bp3AfRiSwvruBkfLr5djCpD-aU6d3AZKqa=FQJOyjg@mail.gmail.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
	<1313144787-30666-3-git-send-email-a.kesavan@samsung.com>
	<20110907095513.GQ6619@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110907095513.GQ6619@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Russell,

On Wed, Sep 7, 2011 at 3:25 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Aug 12, 2011 at 03:56:24PM +0530, Abhilash Kesavan wrote:
>> +ENTRY(s3c_cpu_resume)
>> +#if defined(CONFIG_S3C_PM_DEBUG_LED_SMDK)
>> +
>> +#undef S3C64XX_VA_GPIO
>> +#define S3C64XX_VA_GPIO (0x0)
>> +#define S3C64XX_GPNCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (S3C=
64XX_GPN_BASE + 0x00)
>> +#define S3C64XX_GPNDAT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (S3C=
64XX_GPN_BASE + 0x04)
>> +
>> +#define S3C64XX_GPN_CONMASK(__gpio) =A0(0x3 << ((__gpio) * 2))
>> +#define S3C64XX_GPN_OUTPUT(__gpio) =A0 (0x1 << ((__gpio) * 2))
>> +
>> + =A0 =A0 /* Initialise the GPIO state if we are debugging via the SMDK =
LEDs,
>> + =A0 =A0 =A0* as the uboot version supplied resets these to inputs duri=
ng the
>> + =A0 =A0 =A0* resume checks.
>> + =A0 =A0 */
>> +
>> + =A0 =A0 ldr =A0 =A0 r3, =3DS3C64XX_PA_GPIO
>> + =A0 =A0 ldr =A0 =A0 r0, [ r3, #S3C64XX_GPNCON ]
>> + =A0 =A0 bic =A0 =A0 r0, r0, #(S3C64XX_GPN_CONMASK(12) | S3C64XX_GPN_CO=
NMASK(13) | \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C64XX_GPN_CONMASK(14) | =
S3C64XX_GPN_CONMASK(15))
>> + =A0 =A0 orr =A0 =A0 r0, r0, #(S3C64XX_GPN_OUTPUT(12) | S3C64XX_GPN_OUT=
PUT(13) | \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C64XX_GPN_OUTPUT(14) | S=
3C64XX_GPN_OUTPUT(15))
>> + =A0 =A0 str =A0 =A0 r0, [ r3, #S3C64XX_GPNCON ]
>> +
>> + =A0 =A0 ldr =A0 =A0 r0, [ r3, #S3C64XX_GPNDAT ]
>> + =A0 =A0 bic =A0 =A0 r0, r0, #0xf << 12 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0@ GPN12..15
>> + =A0 =A0 orr =A0 =A0 r0, r0, #1 << 15 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0@ GPN15
>> + =A0 =A0 str =A0 =A0 r0, [ r3, #S3C64XX_GPNDAT ]
>> +#endif
>
> This is incompatible with the aim of a single kernel booting on many ARM
> platforms.
>
> Rather than consolidating down to just one implementation, how about
> consolidating to two - one for everything but SMDK, and one for the SMDK
> with the LED stuff. =A0You can then chose which you want - either the
> s3c_generic_resume (which is just the magic code plus the branch)
> or s3c_smdk_leds_resume (which would be the magic code plus the LEDS
> stuff plus the branch.)
I'll follow this suggestion for only S3C64XX and newer SoCs if that is
OK with Kukjin.
If however the consolidation is needed for all Samsung SoCs including the o=
lder
S3C24XX as well then this may not be workable.
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
Regards,
Abhilash
