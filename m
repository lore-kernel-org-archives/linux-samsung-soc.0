From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCHv2 01/10] ARM: S3C2443: GPIO: Correct AC97 pin defines
Date: Wed, 27 Jan 2010 17:28:15 +0900
Message-ID: <1b68c6791001270028o6e02cb7jbaec0b8a0dde977f@mail.gmail.com>
References: <1264571873-14924-1-git-send-email-jassisinghbrar@gmail.com>
	<20100127081140.GK9153@trinity.fluff.org>
	<1b68c6791001270015o4d5f42b8k858b959816c9b7c9@mail.gmail.com>
	<20100127082447.GL9153@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20100127082447.GL9153@trinity.fluff.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jassi Brar <jassi.brar@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jan 27, 2010 at 5:24 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> On Wed, Jan 27, 2010 at 05:15:28PM +0900, jassi brar wrote:
>> On Wed, Jan 27, 2010 at 5:11 PM, Ben Dooks <ben-linux@fluff.org> wrote:
>> > On Wed, Jan 27, 2010 at 02:57:53PM +0900, jassisinghbrar@gmail.com wrote:
>> >> From: Jassi Brar <jassi.brar@samsung.com>
>> >>
>> >> GPIO_E-[5,9] pin functionality was defined incorrectly.
>> >> The patch corrects and adds missing pins.
>> >
>> > Ok, should I apply this to the fixes tree and send to linus?
>> Honestly speaking, I don't know. Please do as you see due.
>> Maybe Mark Brown, as an affected maintainer, has some opinion?
>> thanks
>
> Ok, couple of questions:
>
> 1) Is it currently causing an working driver to fail?
 No.
> 2) Will it break anything currently in the kernel if merged now?
No.
It is needed for the patch "ARM: S3C24XX: Update AC97 platform resources".

> I'll await Mark's comments.
