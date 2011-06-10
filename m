From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/4] ASoC: SAMSUNG: Change platform driver
 for SMDKs
Date: Fri, 10 Jun 2011 12:56:45 +0530
Message-ID: <BANLkTikswO-5LOreJq=OXutya_CzYUkh1g@mail.gmail.com>
References: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
	<1307606950-8310-4-git-send-email-sbkim73@samsung.com>
	<BANLkTinUk6CRdh8mYAk7fbd9Ga6iBRfcaA@mail.gmail.com>
	<000a01cc273e$49dc4610$dd94d230$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <000a01cc273e$49dc4610$dd94d230$@com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org, lrg@slimlogic.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 10, 2011 at 12:46 PM, Sangbeom Kim <sbkim73@samsung.com> wrote:
> On Thu, Jun 9, 2011 at 4:04 PM, Jassi Brar wrote:
>> NAK.
>> It will break the most common user - SMDK6410, as s3c6410 doesn't have any
>> I2S internal DMA.
>> Please try to test the changes before submitting. I know it's boring,
>> but it's even more important :)
>>
>> Thanks
>
> I only focused on S5PV210 and S5PV310.
> I didn't consider s3c and s5p series.
> In the next version, I will delete it.
Though if then everything works fine with system and internal DMA,
maybe it is better to assign platform_name string at runtime from some
module parameter, and leaving the default to normal system DMA ?

> But I had found some problem and want to share.
> Like this patch, If different platform driver is used for each channel,
> 1st channel is overwritten by platform driver of 2nd channel.
> Have you ever experienced before like this problem?
IIRC, I successfully tested using system DMA with primary and iDMA
with secondary channel. Only the sec chan would keep playing when
the system went to suspend. Though tt was long time ago and I don't remember
which Samsung kernel version.
