From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH RESEND v2 2/7] mfd: cros_ec: Add char dev and virtual
 dev pointers
Date: Tue, 20 Jan 2015 17:45:09 +0100
Message-ID: <54BE8615.7070708@collabora.co.uk>
References: <1420205572-2640-1-git-send-email-javier.martinez@collabora.co.uk> <1420205572-2640-3-git-send-email-javier.martinez@collabora.co.uk> <20150120075011.GS21886@x1> <54BE770D.6030806@collabora.co.uk> <20150120163622.GD30656@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150120163622.GD30656@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

On 01/20/2015 05:36 PM, Lee Jones wrote:
>> > 
>> > Is this safe?  Are you sure it's okay to provide an interface from
>> > userspace to read (kernel?) memory?
>> >
>> 
>> This interface is not to read any kernel memory but only the memory mapped
>> I/O region for the Low Pin Count (LPC) bus. So user-space only can choose
>> and offset and a number of bytes using the CROS_EC_DEV_IOCRDMEM ioctl cmd
>> which uses the following structure as argument:
>> 
>> /*
>>  * @offset: within EC_LPC_ADDR_MEMMAP region
>>  * @bytes: number of bytes to read. zero means "read a string" (including '\0')
>>  *         (at most only EC_MEMMAP_SIZE bytes can be read)
>>  * @buffer: where to store the result
>>  * ioctl returns the number of bytes read, negative on error
>>  */
>> struct cros_ec_readmem {
>>         uint32_t offset;
>>         uint32_t bytes;
>>         uint8_t buffer[EC_MEMMAP_SIZE];
>> };
>> 
>> The cros_ec_lpc_readmem() handler that the function pointer is set only
>> reads bytes from EC_LPC_ADDR_MEMMAP + offset if offset < EC_MEMMAP_SIZE
>> and the data is copied to the user-space buffer from the structure passed
>> as argument with copy_to_user().
>> 
>> So in that sense is similar to the spidev or i2c-dev interfaces that are
>> used to access these buses from user-space.
> 
> Very well.  The purpose of my question was to be provocative and to
> make you think about the interface.  As long as you're sure it can't
> be abused, then I'm happy.
> 

Ok, thanks a lot. Does it mean I've your Acked-by for this patch too?

Best regards,
Javier
