From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: 4879b7ae05 ("Merge tag 'dmaengine-4.12-rc1' of .."): WARNING:
 kernel stack regs at bd92bc2e in 01-cpu-hotplug:3811 has bad 'bp' value
 000001be
Date: Mon, 2 Oct 2017 16:31:09 -0500
Message-ID: <20171002213109.5n3skzy76edhwkvf@treble>
References: <59d177a7.vsiddgOxdHRIlRvy%fengguang.wu@intel.com>
 <CA+55aFz_ijfUxyk2kdLhfzfS1z0_uRBw6eQb9UxFvh=5zOzzaw@mail.gmail.com>
 <20171002212654.rsm4uj3hfioddldd@treble>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171002212654.rsm4uj3hfioddldd@treble>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kernel test robot <fengguang.wu@intel.com>, LKP <lkp@01.org>, linux-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, dma <dmaengine@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, LKML <linux-kernel@vger.kernel.org>, wfg@linux.intel.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Oct 02, 2017 at 04:26:54PM -0500, Josh Poimboeuf wrote:
> Fengguang, assuming it's reliably recreatable, any chance you could
> recreate with the following patch?

Sorry, here's a version which actually compiles.

diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_frame.c
index d145a0b1f529..00234fa5a33a 100644
--- a/arch/x86/kernel/unwind_frame.c
+++ b/arch/x86/kernel/unwind_frame.c
@@ -44,7 +44,8 @@ static void unwind_dump(struct unwind_state *state)
 			state->stack_info.type, state->stack_info.next_sp,
 			state->stack_mask, state->graph_idx);
 
-	for (sp = state->orig_sp; sp; sp = PTR_ALIGN(stack_info.next_sp, sizeof(long))) {
+	for (sp = PTR_ALIGN(state->orig_sp, sizeof(long)); sp;
+	     sp = PTR_ALIGN(stack_info.next_sp, sizeof(long))) {
 		if (get_stack_info(sp, state->task, &stack_info, &visit_mask))
 			break;
 
