From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2 2/7] mfd: cros_ec: Add char dev and virtual dev
 pointers
Date: Tue, 20 Jan 2015 16:36:22 +0000
Message-ID: <20150120163622.GD30656@x1>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk>
 <1420205572-2640-3-git-send-email-javier.martinez@collabora.co.uk>
 <20150120075011.GS21886@x1>
 <54BE770D.6030806@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54BE770D.6030806@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 20 Jan 2015, Javier Martinez Canillas wrote:

> Hello Lee,
>=20
> Thanks a lot for your feedback.
>=20
> On 01/20/2015 08:50 AM, Lee Jones wrote:
> >> @@ -59,9 +60,17 @@ struct cros_ec_command {
> >>   *
> >>   * @ec_name: name of EC device (e.g. 'chromeos-ec')
> >>   * @phys_name: name of physical comms layer (e.g. 'i2c-4')
> >> - * @dev: Device pointer
> >> + * @dev: Device pointer for physical comms device
> >> + * @vdev: Device pointer for virtual comms device
> >> + * @cdev: Character device structure for virtual comms device
> >>   * @was_wake_device: true if this device was set to wake the syst=
em from
> >>   * sleep at the last suspend
> >> + * @cmd_readmem: direct read of the EC memory-mapped region, if s=
upported
> >> + *     @offset is within EC_LPC_ADDR_MEMMAP region.
> >> + *     @bytes: number of bytes to read. zero means "read a string=
" (including
> >> + *     the trailing '\0'). At most only EC_MEMMAP_SIZE bytes can =
be read.
> >> + *     Caller must ensure that the buffer is large enough for the=
 result when
> >> + *     reading a string.
> >>   *
> >>   * @priv: Private data
> >>   * @irq: Interrupt to use
> >> @@ -90,8 +99,12 @@ struct cros_ec_device {
> >>  	const char *ec_name;
> >>  	const char *phys_name;
> >>  	struct device *dev;
> >> +	struct device *vdev;
> >> +	struct cdev cdev;
> >>  	bool was_wake_device;
> >>  	struct class *cros_class;
> >> +	int (*cmd_readmem)(struct cros_ec_device *ec, unsigned int offse=
t,
> >> +			   unsigned int bytes, void *dest);
> >=20
> > Is this safe?  Are you sure it's okay to provide an interface from
> > userspace to read (kernel?) memory?
> >
>=20
> This interface is not to read any kernel memory but only the memory m=
apped
> I/O region for the Low Pin Count (LPC) bus. So user-space only can ch=
oose
> and offset and a number of bytes using the CROS_EC_DEV_IOCRDMEM ioctl=
 cmd
> which uses the following structure as argument:
>=20
> /*
>  * @offset: within EC_LPC_ADDR_MEMMAP region
>  * @bytes: number of bytes to read. zero means "read a string" (inclu=
ding '\0')
>  *         (at most only EC_MEMMAP_SIZE bytes can be read)
>  * @buffer: where to store the result
>  * ioctl returns the number of bytes read, negative on error
>  */
> struct cros_ec_readmem {
>         uint32_t offset;
>         uint32_t bytes;
>         uint8_t buffer[EC_MEMMAP_SIZE];
> };
>=20
> The cros_ec_lpc_readmem() handler that the function pointer is set on=
ly
> reads bytes from EC_LPC_ADDR_MEMMAP + offset if offset < EC_MEMMAP_SI=
ZE
> and the data is copied to the user-space buffer from the structure pa=
ssed
> as argument with copy_to_user().
>=20
> So in that sense is similar to the spidev or i2c-dev interfaces that =
are
> used to access these buses from user-space.

Very well.  The purpose of my question was to be provocative and to
make you think about the interface.  As long as you're sure it can't
be abused, then I'm happy.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
